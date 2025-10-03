import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_year_project/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'Template/Templeate_textfiedl.dart';
import 'SendAgreement.dart';

class AgreementPage extends StatefulWidget {
  final int id;
  final String mode; // "view", "sign", or "edit"
  final String email;
  final bool fromPage23; // New flag to identify navigation from page23
  final bool fromPage24; // New flag to identify navigation from page24

  const AgreementPage({
    super.key,
    required this.id,
    required this.mode,
    required this.email,
    this.fromPage23 = false,
    this.fromPage24 = false,
  });

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  String? signature_url1;
  String? signature_url2;
  bool _loading = true;
  String? _error;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController party1Controller = TextEditingController();
  final TextEditingController party2Controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final Map<String, TextEditingController> descriptionController = {};
  final Map<String, TextEditingController> descriptionKeyController = {};
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  bool isLoading = true;
  bool isSubmitting = false;
  int _agreementId = 0;
  bool _showFirstPartySignature = false;
  bool _showSignaturePad = false;
  bool _allowEditing = false;

  @override
  void initState() {
    super.initState();
    _determineViewMode();
    _fetchAgreementData();
  }

  void _determineViewMode() {
    if (widget.fromPage23) {
      // From page23: Show first party signature and signature pad
      _showFirstPartySignature = true;
      _showSignaturePad = true;
      _allowEditing = false;
    } else if (widget.fromPage24) {
      // From page24: Show both signatures and allow editing
      _showFirstPartySignature = true;
      _showSignaturePad = false;
      _allowEditing = true;
    } else {
      // Default behavior based on original mode
      _showFirstPartySignature = true;
      _showSignaturePad = widget.mode == "sign";
      _allowEditing = widget.mode == "edit";
    }
  }

  Future<void> signAgreement(int ids, SignatureController signatureController) async {
    final url = Uri.parse('https://nda.yourailist.com/api/signAgreement');

    try {
      setState(() {
        _loading = true;
      });

      File? signatureFile;

      if (signatureController.isNotEmpty) {
        final signature = await signatureController.toImage();
        final byteData = await signature!.toByteData(format: ImageByteFormat.png);
        final pngBytes = byteData!.buffer.asUint8List();
        final tempDir = await getTemporaryDirectory();
        signatureFile = await File('${tempDir.path}/signature.png').writeAsBytes(pngBytes);
      }

      var request = http.MultipartRequest("POST", url);
      request.fields['email'] = widget.email;
      request.fields['agreement_id'] = ids.toString();

      if (signatureFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'signature',
          signatureFile.path,
          contentType: MediaType('image', 'png'),
        ));
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Page21()));
      } else {
        setState(() {
          _error = "Error: ${data['message']}";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_error!)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _fetchAgreementData() async {
    try {
      final response = await http.post(
        Uri.parse("https://nda.yourailist.com/api/getSingleAgreement"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": widget.id, 'email': widget.email}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final agreement = data['agreement'];
        final agreementFile = jsonDecode(agreement['agreement_file']);

        setState(() {
          titleController.text = agreementFile['Agreement']['title'] ?? '';
          party1Controller.text = agreementFile['Agreement']['parties']['Employee']['name'] ?? '';
          party2Controller.text = agreementFile['Agreement']['parties']['Employer']['name'] ?? '';
          dateController.text = agreementFile['Agreement']['date'] ?? '';
          signature_url1 = agreement['signature_url1'];
          signature_url2 = agreement['signature_url2'];
          _agreementId = widget.id;

          descriptionController.clear();
          descriptionKeyController.clear();
          agreementFile['Agreement']['Description']?.forEach((key, value) {
            descriptionController[key] = TextEditingController(text: value.toString());
            descriptionKeyController[key] = TextEditingController(text: key.toString());
          });

          isLoading = false;
        });
      } else {
        throw Exception("Failed to fetch agreement");
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  Future<String?> _getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  Future<void> _saveAgreementId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('agreement_id', id);
  }

  Future<void> _sendDataToAPI() async {
    final status = widget.mode == "sign" ? "complete" : "draft";

    try {
      setState(() => isSubmitting = true);

      File? signatureFile;

      if (_showSignaturePad && _signatureController.isNotEmpty) {
        final signature = await _signatureController.toImage();
        final byteData = await signature!.toByteData(format: ImageByteFormat.png);
        final pngBytes = byteData!.buffer.asUint8List();
        final tempDir = await getTemporaryDirectory();
        signatureFile = await File('${tempDir.path}/signature.png').writeAsBytes(pngBytes);
      }

      Map<String, dynamic> jsonData = {
        "Agreement": {
          "title": titleController.text,
          "parties": {
            "Employer": {"name": party2Controller.text},
            "Employee": {"name": party1Controller.text}
          },
          "date": dateController.text,
          "Description": descriptionController.map(
                  (key, controller) => MapEntry(key, controller.text)
          ),
        }
      };

      String jsonString = jsonEncode(jsonData);

      var request = http.MultipartRequest(
          "POST",
          Uri.parse("https://nda.yourailist.com/api/create_agreement")
      );

      String? token = await _getUserToken();
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      });

      request.fields['email'] = widget.email;
      request.fields['slug'] = "agreement_slug";
      request.fields['title'] = titleController.text;
      request.fields['agreement_file'] = jsonString;
      request.fields['status'] = status;
      request.fields['id'] = widget.id.toString();

      if (signatureFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'signature',
          signatureFile.path,
          contentType: MediaType('image', 'png'),
        ));
      }

      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(responseBody.body);
        _agreementId = responseData['agreement_id'];
        String message = responseData['message'];

        await _saveAgreementId(_agreementId);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Agreement ${status == 'draft' ? 'saved' : 'created'} successfully")),
        );

        if (status == 'draft') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendAgreement(agreement_ids: _agreementId),
            ),
          );
        }
      } else {
        throw Exception("API Error: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("Agreement (NDA)")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Agreement (NDA)")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Agreement Info
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: size.width - 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black87,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        controller: titleController,
                        hintText: "Agreement Title",
                        color: Colors.white,
                        txtsize: 16.0,
                        maxLines: 3,
                        readOnly: !_allowEditing,
                      ),
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: party1Controller,
                              color: const Color(0xff00C2FF),
                              hintText: "Employee's Name",
                              maxLines: 3,
                              readOnly: !_allowEditing,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: party2Controller,
                              hintText: "Employer's Name",
                              color: const Color(0xff00C2FF),
                              maxLines: 3,
                              readOnly: !_allowEditing,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: CustomTextField(
                        controller: dateController,
                        hintText: "Date",
                        color: Colors.white,
                        readOnly: !_allowEditing,
                        onTap: _allowEditing
                            ? () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            dateController.text =
                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                          }
                        })
                            : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description Section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: descriptionController.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: descriptionKeyController[entry.key] ??
                                TextEditingController(text: entry.key),
                            txtsize: 14.0,
                            Fontweight: FontWeight.w700,
                            readOnly: true,
                          ),
                          CustomTextField(
                            controller: entry.value,
                            txtsize: 12.0,
                            Fontweight: FontWeight.w400,
                            readOnly: !_allowEditing,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // First Party Signature (conditionally shown)
            if (_showFirstPartySignature) ...[
              const Text("Signature of First Party"),
              CachedNetworkImage(
                imageUrl: signature_url1 ?? '',
                height: 150,
                imageBuilder: (context, imageProvider) => Container(
                  width: size.width - 20,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                  height: 150,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              ),
              const SizedBox(height: 30),
            ],

            // Second Party Signature or Signature Pad
            if (_showSignaturePad)
              _buildSignaturePad(size)
            else if (signature_url2 != null && signature_url2!.isNotEmpty)
              Column(
                children: [
                  const Text("Signature of Second Party"),
                  CachedNetworkImage(
                    imageUrl: signature_url2 ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      width: size.width - 20,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          image: imageProvider,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // Action Buttons
            if (_showSignaturePad || _allowEditing)
              _buildActionButtons(size),
          ],
        ),
      ),
    );
  }

  Widget _buildSignaturePad(Size size) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 123,
        width: size.width - 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Signature(
              controller: _signatureController,
              height: 60,
              backgroundColor: Colors.grey.shade300,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Signature of Second Party',
                style: TextStyle(fontSize: 12, color: Color(0xffA9ACB0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(Size size) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: isSubmitting ? null : () {
            if (_showSignaturePad) {
              signAgreement(_agreementId, _signatureController);
            } else {
              _sendDataToAPI();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
          ),
          child: isSubmitting
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
              _showSignaturePad ? 'Sign & Share' : 'Update & Share',
              style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    party1Controller.dispose();
    party2Controller.dispose();
    dateController.dispose();
    descriptionController.forEach((_, c) => c.dispose());
    descriptionKeyController.forEach((_, c) => c.dispose());
    _signatureController.dispose();
    super.dispose();
  }
}











































// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:signature/signature.dart';
//
// import 'SendAgreement.dart';
// import 'Template/Templeate_textfiedl.dart';
//
// class AgreementPage extends StatefulWidget {
//   final int id;
//   final String mode;
//   final String email; // "view", "sign", "edit"
//   const AgreementPage({
//     super.key,
//     required this.id,
//     required this.mode,
//     required this.email,
//   });
//
//
//   @override
//   State<AgreementPage> createState() => _AgreementPageState();
// }
//
// class _AgreementPageState extends State<AgreementPage> {
//
//   String? signature_url1;
//   String? signature_url2;
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController party1Controller = TextEditingController();
//   final TextEditingController party2Controller = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//
//   final Map<String, TextEditingController> descriptionController = {};
//   Map<String, TextEditingController> descriptionkeyController = {};
//   final SignatureController _controller = SignatureController();
//
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getSingleAgreement(widget.id);
//   }
//
//   Future<void> _sendDataToAPI() async {
//     const String apiUrl = "https://Nda.yourailist.com/api/create_agreement";
//     try {
//       Map<String, dynamic> jsonData = {
//         "Agreement": {
//           "title": titleController.text,
//           "parties": {
//             "Employer": {"name": party1Controller.text},
//             "Employee": {"name": party2Controller.text}
//           },
//           "date": dateController.text,
//           "Description": {}
//         }
//       };
//
//       descriptionController.forEach((key, controller) {
//         jsonData["Agreement"]["Description"][key] = controller.text;
//       });
//
//       String jsonString = jsonEncode(jsonData);
//
//       Map<String, dynamic> createAgreement = {
//         "email": widget.email,
//
//         "slug": "slug",
//         "title": titleController.text,
//         "agreement_file": jsonString,
//         "signature": "true",
//         "id": widget.id,
//       };
//
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(createAgreement),
//       );
//
//       if (response.statusCode == 200) {
//         print(response.body);
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//        debugPrint(response.body);
//         int agreementId = responseData['agreement_id'];
//         if (kDebugMode) {
//           print("Agreement ID: $agreementId");
//         }
//       } else {
//         if (kDebugMode) {
//           print("Failed to send data: ${response.statusCode}");
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error sending data: $e");
//       }
//     }
//   }
//
//   Future<void> getSingleAgreement(int userId) async {
//     try {
//       final response = await http.post(
//         Uri.parse("https://nda.yourailist.com/api/getSingleAgreement"),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json",
//         },
//         body: jsonEncode(
//             {
//               "id": userId,
//             'email': widget.email,
//             },
//         ),      );
//
//       if (response.statusCode == 200) {
//         print("${response.body}this is the response");
//         print(response.statusCode);
//         final data = jsonDecode(response.body);
//         print(data);
//         final agreement = data['agreement'];
//
//         print(agreement);
//         final agreementFile = jsonDecode(agreement['agreement_file']);
//         print(agreementFile);
//
//         titleController.text = agreementFile['Agreement']['title'] ?? '';
//         party1Controller.text = agreementFile['Agreement']['parties']['Employee']['name'] ?? '';
//         party2Controller.text = agreementFile['Agreement']['parties']['Employer']['name'] ?? '';
//         dateController.text = agreementFile['Agreement']['date'] ?? '';
//         signature_url1 = agreement['signature_url1'] ?? '';
//         signature_url2 = agreement['signature_url2'] ?? '';
//
//         final descriptionMap = agreementFile['Agreement']['Description'];
//         descriptionMap.forEach((key, value) {
//           descriptionController[key] = TextEditingController(text: value);
//           descriptionkeyController[key] = TextEditingController(text: key);
//         });
//
//         setState(() {
//           isLoading = false;
//         });
//         print("Signature URL No 1: $signature_url1");
//         print("Signature URL No 2: $signature_url2");
//       } else {
//         throw Exception("Failed to fetch agreement");
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error fetching agreement: $e");
//       }
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   bool get isEditable => widget.mode == "edit";
//   bool get showSignature => widget.mode == "sign";
//   bool get showSubmitButton => widget.mode == "sign" || widget.mode == "edit";
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Agreement (NDA)")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           children: [
//             // Agreement Info
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: Container(
//                 width: size.width - 15,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.black87,
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: CustomTextField(
//                         controller: titleController,
//                         hintText: "Agreement Title",
//                         color: Colors.white,
//                         txtsize: 16.0,
//                         maxLines: 3,
//                         readOnly: !isEditable,
//                       ),
//                     ),
//                     const Divider(color: Colors.grey, thickness: 1),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: CustomTextField(
//                               controller: party1Controller,
//                               color: const Color(0xff00C2FF),
//                               hintText: "Employee's Name",
//                               maxLines: 3,
//                               readOnly: !isEditable,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: CustomTextField(
//                               controller: party2Controller,
//                               hintText: "Employer's Name",
//                               color: const Color(0xff00C2FF),
//                               maxLines: 3,
//                               readOnly: !isEditable,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 100),
//                       child: CustomTextField(
//                         controller: dateController,
//                         hintText: "Date",
//                         color: Colors.white,
//                         readOnly: true,
//                         onTap: isEditable
//                             ? () => showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100),
//                         ).then((pickedDate) {
//                           if (pickedDate != null) {
//                             dateController.text =
//                             "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
//                           }
//                         })
//                             : null,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Description Section
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 padding: const EdgeInsets.all(15),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   children: descriptionController.entries.map((entry) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomTextField(
//                           //  controller: descriptionkeyController[entry.key],
//                             controller: descriptionkeyController[entry.key] ??
//                                     TextEditingController(text: entry.key),
//                             txtsize: 14.0,
//                             Fontweight: FontWeight.w700,
//                             readOnly: true,
//                           ),
//                           CustomTextField(
//                             controller: entry.value,
//                             txtsize: 12.0,
//                             Fontweight: FontWeight.w400,
//                             readOnly: !isEditable,
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//
//
//
//
//             SizedBox(height: 20),
//
//
//
//           Text(("Signature of First Party")),
//             CachedNetworkImage(
//               imageUrl: signature_url1 ?? '',
//               height: 150,
//               imageBuilder: (context, imageProvider) => Container(
//                 width: size.width - 20,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.white38, // Background color
//                   image: DecorationImage(
//                     image: imageProvider,
//                     fit: BoxFit.contain, // Use 'contain' for signature-like images
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ),
//               placeholder: (context, url) => SizedBox(
//                 height: 150,
//                 child: Center(child: CircularProgressIndicator()),
//               ),
//               errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
//             ),
//
//             SizedBox(height: 30),
//
//             CachedNetworkImage(
//               imageUrl: signature_url2 ?? '',
//               imageBuilder: (context, imageProvider) => Container(
//                 width: size.width - 20,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.white, // 👈 Change background color here
//                   image: DecorationImage(
//                     filterQuality: FilterQuality.high,
//                     image: imageProvider,
//                     fit: BoxFit.contain,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ),
//               placeholder: (context, url) => CircularProgressIndicator(),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//
//
//
//             SizedBox(height: 20),
//
//
//
//             // Signature
//             if (showSignature)
//               _signatureBlock(size, label: "Signature of Second Party", useSignaturePad: true),
//
//             // Submit Button
//             if (showSubmitButton) _actionButtons(size),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _signatureBlock(Size size, {required String label, bool useSignaturePad = true}) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         height: 123,
//         width: size.width - 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey.shade300,
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             if (useSignaturePad)
//               Signature(
//                 controller: _controller,
//                 height: 60,
//                 backgroundColor: Colors.grey.shade300,
//               ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 label,
//                 style: const TextStyle(fontSize: 12, color: Color(0xffA9ACB0)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _actionButtons(Size size) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             await _sendDataToAPI();
//             Navigator.push(context, MaterialPageRoute(builder: (context) => Page40(agreement_ids: widget.id)),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//             padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
//           ),
//           child: Text(widget.mode == "edit" ? 'Update' : 'Sign',
//               style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

