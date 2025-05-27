import 'dart:convert';
import 'dart:ui';

import 'package:final_year_project/Page21.dart';
import 'package:final_year_project/Page_40.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

import '../Widgets/Reusable Date Picker.dart';
import 'Templeate_textfiedl.dart';
import 'package:http_parser/http_parser.dart';


// these for circular progress indicator
bool _isCreating = false;
bool _isSavingDraft = false;
bool _isLoading = false;

enum Status {
  complete,
  draft,
  pending,
}
class AgreementDatail extends StatefulWidget {
  final istemplet;
  final filename;

  AgreementDatail(this.istemplet, this.filename, {super.key});

  @override
  _AgreementDatailState createState() => _AgreementDatailState();
}

class _AgreementDatailState extends State<AgreementDatail> {
  Map<String, TextEditingController> descriptionController = {};
  Map<String, TextEditingController> descriptionkeyController = {};
  // Map<String, TextEditingController> valuecontrollers = {};
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    //exportBackgroundColor: Colors.white,
    strokeCap: StrokeCap.round, // Defines how stroke edges appear (round, square, etc.)
    strokeJoin: StrokeJoin.round, // Defines how stroke joints appear (round, bevel, etc.)
    onDrawStart: () => print("Drawing started"), // Called when drawing starts
    onDrawEnd: () => print("Drawing ended"), // Called when drawing ends

  );

  String? base64Signature;
  @override
  void dispose() {
    signatureController.dispose();
    super.dispose();
  }
  Map<String, dynamic>? agreementData;
  Map<String, String>? description;
  final  whareas = '';
  String _email = '';
  int Agreement_id = 0;

  bool isEditing = false; // To track edit mode

  TextEditingController titleController = TextEditingController();
  TextEditingController party1Controller = TextEditingController();
  TextEditingController party2Controller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController slugController = TextEditingController();





  @override
  void initState() {
    loadAgreementJson();
    _loadUserInfo();
    super.initState();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      _email = prefs.getString('user_email') ?? '';
    });
  }
  Future<void> loadAgreementJson() async {
    String jsonString;
    if(widget.istemplet) {
      // boolean variable
      jsonString =  await rootBundle.loadString('assets/'+widget.filename);
    } else {
      jsonString = await readJsonFromFiles();
    }
    setState(() {
      // String jsonString =  readJsonFromFile();
      agreementData = jsonDecode(jsonString);

      // Extract the description map
      Map<String, dynamic> descriptionMap = agreementData!['Agreement']['Description'];
      titleController.text=agreementData?['Agreement']?['title']??"";
      party1Controller.text=agreementData?['Agreement']?['name1']??"";
      party2Controller.text=agreementData?['Agreement']?['name2']??"";
      dateController.text=agreementData?['Agreement']?['date']??"";

      // Initialize controllers for each key-value pair
      descriptionMap.forEach((key, value) {
        descriptionController[key] = TextEditingController(text: value.toString());
        descriptionkeyController[key] = TextEditingController(text: key.toString());
      });
    });
  }
  /// *Step 1: Get File Path*
  Future<File> _getLocalFile() async {
    // final directory = await getApplicationDocumentsDirectory();
    final directory = await getExternalStorageDirectory(); // For Android's public storage
    print('${directory?.path}');
    return File('${directory?.path}/text_data.json');
  }
  Future<void> saveTextToJson() async {
    try {
      File file = await _getLocalFile();
      int count = 0 ;
      // Convert text controllers to JSON format
      Map<String, dynamic> jsonData = {
        "Agreement": {
          "title": titleController.text,
          "parties": {
            "Employer": {"name": party1Controller.text},
            "Employee": {"name": party2Controller.text}
          },
          "date": dateController.text,
          "Description": {}
        }
      };
      // Loop through description controllers to add to JSON
      descriptionController.forEach((key, controller) {
        print("this is the start ");
        print(descriptionkeyController[key]?.text);
        if(descriptionkeyController[key]?.text != null && descriptionkeyController[key]?.text != ""){
          jsonData["Agreement"]["Description"][descriptionkeyController[key]?.text] = controller.text;
        }else{
          jsonData["Agreement"]["Description"][(++count).toString()] = controller.text;
          print("this is else condition : ");
          print(jsonData);
        }
      });
      print(jsonData);
      // Convert Map to JSON string
      String jsonString = jsonEncode(jsonData);

      // Write JSON to file
      await file.writeAsString(jsonString);
      print("✅ Text saved to JSON file!");

    } catch (e) {
      print("❌ Error saving JSON: $e");
    }
  }
  Future<String> readJsonFromFiles () async {
    try {
      File file = await _getLocalFile(); // Get the file path

      if (await file.exists()) {
        String jsonString = await file.readAsString(); // Read file as a string
        return jsonString; // Return the JSON string
      } else {
        print("⚠ File does not exist!");
        return "{}"; // Return empty JSON if file is missing
      }
    } catch (e) {
      print("❌ Error reading JSON file: $e");
      return "{}"; // Return empty JSON on error
    }
  }
  Future<void> _sendDataToAPIs(String status, {int id = 0}) async {
    const String apiUrl = "https://nda.yourailist.com/api/create_agreement";

    setState(() {
      _isLoading = true;
    });

    try {
      final signatureBytes = await signatureController.toPngBytes();
      if (signatureBytes == null || signatureBytes.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please provide a signature')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }
// Save PNG to temporary file
      final tempDir = await getTemporaryDirectory();
      final signatureFile = File('${tempDir.path}/signature.png');
      await signatureFile.writeAsBytes(signatureBytes);

      Map<String, dynamic> jsonData = {
        "Agreement": {
          "title": titleController.text,
          "parties": {
            "Employer": {"name": party1Controller.text},
            "Employee": {"name": party2Controller.text}
          },
          "date": dateController.text,
          "Description": {}
        }
      };

      descriptionController.forEach((key, controller) {
        jsonData["Agreement"]["Description"][key] = controller.text;
      });

      Map<String, dynamic> createAgreement = {
        "email": _email,
        "slug": titleController.text.toLowerCase().replaceAll(" ", "_"), // Use dynamic slug
        "title": titleController.text,
        "agreement_file": jsonEncode(jsonData),
       // "signature": base64Signature,
        "signature": signatureFile,

        "status": status,
        "id": id,

      };

      print("Payload: ${jsonEncode(createAgreement)}");

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(createAgreement),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Response: $responseData");

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('agreement_id', responseData['agreement_id']);
        Agreement_id = prefs.getInt('agreement_id')!;
        print("Agreement ID saved: $Agreement_id");
      } else {
        print("Failed to send data. Status code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");

      if (e is SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }



  Future<void> _sendDataToAPI(String status, {int id = 0}) async {
    const String apiUrl = "https://Nda.yourailist.com/api/create_agreement";

    try {
      setState(() {
        _isLoading = true;
      });

      File? signatureFile;

      // ✅ Convert signature to PNG
      if (signatureController.isNotEmpty) {
        final signature = await signatureController.toImage();
        final byteData = await signature!.toByteData(format: ImageByteFormat.png);
        final pngBytes = byteData!.buffer.asUint8List();
        final tempDir = await getTemporaryDirectory();
        signatureFile = await File('${tempDir.path}/signature.png').writeAsBytes(pngBytes);
      }

      print('Signature file: $signatureFile');

      // ✅ Prepare agreement JSON structure
      Map<String, dynamic> jsonData = {
        "Agreement": {
          "title": titleController.text,
          "parties": {
            "Employer": {"name": party1Controller.text},
            "Employee": {"name": party2Controller.text}
          },
          "date": dateController.text,
          "Description": {}
        }
      };

      // ✅ Add dynamic description fields
      descriptionController.forEach((key, controller) {
        jsonData["Agreement"]["Description"][key] = controller.text;
      });

      // ✅ Convert to JSON string
      String jsonString = jsonEncode(jsonData);

      // ✅ Create multipart request
      var request = http.MultipartRequest("POST", Uri.parse(apiUrl),);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('user_token');
      print('Token : $token');

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      });


   request.fields['email'] = _email;
      request.fields['slug'] = "slug";
      request.fields['title'] = titleController.text;
      request.fields['agreement_file'] = jsonString;
      request.fields['status'] = status;
      print("$id this is and id ");

      // ✅ Attach signature if available
      if (signatureFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'signature',
          signatureFile.path,
          contentType: MediaType('image', 'png'),
        ));
      }

      // ✅ Send request
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(responseBody.body);

        int agreementId = responseData['agreement_id'];
        String message = responseData['message'];

        print("Agreement ID: $agreementId");
        print("Message: $message");

        // ✅ Save to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('agreement_id', agreementId);
        Agreement_id = prefs.getInt('agreement_id')!;
        print("Agreement ID saved to SharedPreferences!");
      } else {
        print("Failed to send data. Status code: ${response.statusCode}");
        print("Response Body: ${responseBody.body}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");

      if (e is SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Agreement (NDA)"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade600,
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Party 1',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Party 2',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: party1Controller,
                              color: const Color(0xff00C2FF),
                              hintText: "Employee's Name",
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: party2Controller,
                              hintText: "Employer's Name",
                              color: const Color(0xff00C2FF),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: CustomTextField(
                          readOnly: true,
                          onTap: () => DatePickerUtil.selectDate(context, dateController),
                          controller: dateController,
                          hintText: "Date",
                          maxLines: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: descriptionController.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: descriptionkeyController[entry.key] ??
                                TextEditingController(text: entry.key),
                            txtsize: 16.0,

                            Fontweight:FontWeight.bold ,
                          ),
                          CustomTextField(
                              controller: entry.value,

                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(children: [
              const Spacer(),
              const Text(
                "First Party",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const Spacer(flex: 3),
              const Text(
                '00-00-0000',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
            ]),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Signature(
                        controller: signatureController, // Define a second controller for Party 2
                        height: 123,
                        backgroundColor: Colors.grey.shade300,
                        dynamicPressureSupported: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Signature of Second party',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA9ACB0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isEmpty ||
                    party1Controller.text.isEmpty ||
                    party2Controller.text.isEmpty ||
                    dateController.text.isEmpty ||
                    signatureController.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please Sign The Agreement.")),
                  );
                  return;
                }

                setState(() {
                  _isCreating = true;
                });

                try {
                  await _sendDataToAPI(Status.draft.toString());


                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data submitted successfully")),
                  );

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page40(agreement_ids: Agreement_id),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${e.toString()}")),
                  );
                } finally {
                  setState(() {
                    _isCreating = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: _isCreating
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Create', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await _sendDataToAPI("draft");
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page21(),
                  ),
                );

                //await  _saveSignature();




                //  saveTextToJson();

                //Navigator.push(context, MaterialPageRoute(builder: (context) => const Page36()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                // backgroundColor: Colors.blueAccent.shade400,
                backgroundColor: const Color.fromRGBO(71, 70, 70, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 19),
              ),
              child: const Text(
                'Save as Draft',
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );

  }
}