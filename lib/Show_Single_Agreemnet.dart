import 'dart:convert';
import 'package:final_year_project/Page21.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signature/signature.dart';

import 'Template/Templeate_textfiedl.dart'; // If you're using a signature package

class AgreementPage extends StatefulWidget {

  final id; //this is user id
  const AgreementPage( {super.key, this.id,});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController party1Controller = TextEditingController();
  final TextEditingController party2Controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final Map<String, TextEditingController> descriptionController = {};
  Map<String, TextEditingController> descriptionkeyController = {};
  final SignatureController _controller = SignatureController();

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchAgreement(widget.id); // Replace with actual ID
  }


  Future<void> _sendDataToAPI({int id = 0}) async {
    const String apiUrl = "https://Nda.yourailist.com/api/create_agreement";
    try {
      // Prepare the agreement JSON structure
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

      // Add dynamic description fields
      descriptionController.forEach((key, controller) {
        jsonData["Agreement"]["Description"][key] = controller.text;
      });

      // Convert the Agreement Map to JSON string
      String jsonString = jsonEncode(jsonData);

      // Prepare final payload for API
      Map<String, dynamic> createAgreement = {
        "email":  "muhammadkhan8338@gmail.com",
        "slug": "slug",
        "title": titleController.text,
        "agreement_file": jsonString,
        //"signature": base64Signature,
         "signature": "true",
        "id": widget.id,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(createAgreement),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData);
        print(widget.id +" \t this is the id" );

        int agreementId = responseData['agreement_id'];
        String message = responseData['message'];

        print("Agreement ID: $agreementId");
        print("Message: $message");


        // ✅ Save agreementId to SharedPreferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('agreement_id', agreementId);
        // Agreement_id = prefs.getInt('agreement_id')!;
        // print("$Agreement_id the is the share perfersnce is dis ");

        print("Agreement ID saved to SharedPreferences!");
      } else {
        print("Failed to send data. Status code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Error sending data: $e");
    }
  }

  Future<void> fetchAgreement(int userId) async {
    try {
      final response = await http.post(
        Uri.parse("https://nda.yourailist.com/api/getSingleAgreement"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"id": userId}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final agreement = data['agreement'];
        final agreementFile = jsonDecode(agreement['agreement_file']);

        titleController.text = agreementFile['Agreement']['title'] ?? '';
        party1Controller.text = agreementFile['Agreement']['parties']['Employee']['name'] ?? '';
        party2Controller.text = agreementFile['Agreement']['parties']['Employer']['name'] ?? '';
        dateController.text = agreementFile['Agreement']['date'] ?? '';

        final descriptionMap = agreementFile['Agreement']['Description'];
        descriptionMap.forEach((key, value) {
          //jsonData["Agreement"]["Description"][key] = controller.text;
          descriptionController[key] = TextEditingController(text: value);
          descriptionController[value] = TextEditingController(text: value);
        });

        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception("Failed to fetch agreement");
      }
    } catch (e) {
      print("Error fetching agreement: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar( title: Text("Agreement (NDA)")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            // Header Container
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
                          Text('Party 1',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Text('Party 2',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
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
                          onTap: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          ).then((pickedDate) {
                            if (pickedDate != null) {
                              dateController.text =
                              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                            }
                          }),
                          controller: dateController,
                          hintText: "Date",
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

            // Agreement Description Section
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15.0),
            //       color: Colors.white,
            //     ),
            //     padding: const EdgeInsets.all(15),
            //     height: 600,
            //     child: ListView(
            //       children: descriptionController.entries.map((entry) {
            //         return Padding(
            //           padding: const EdgeInsets.only(bottom: 10),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold)),
            //               const SizedBox(height: 5),
            //               CustomTextField(controller: entry.value),
            //               const SizedBox(height: 20),
            //             ],
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0,right: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),

                child: SizedBox(
                    height: 600,
                    child: ListView(
                      children: descriptionController.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                controller: descriptionkeyController[entry.key] ??
                                    TextEditingController(text: entry.key), // Fallback in case it's null
                              ),
                              CustomTextField(
                                controller: entry.value,
                              ),


                              SizedBox(height: 40,),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ),
            ),

            const SizedBox(height: 60),
            // Signature Area - First Party
            _signatureBlock(size, label: "Signature of First Party"),
            const SizedBox(height: 30),
            // Signature Area - Second Party
            _signatureBlock(size, label: "Signature of Second Party", useSignaturePad: true),
            const SizedBox(height: 20),
            // Buttons
            _actionButtons(size),
          ],
        ),
      ),
    );
  }

  Widget _signatureBlock(Size size, {required String label, bool useSignaturePad = false}) {
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
            if (!useSignaturePad)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xff474646),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.qr_code_scanner, color: Colors.lightBlueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (useSignaturePad)
              Signature(
                controller: _controller,
                height: 60,
                backgroundColor: Colors.grey.shade300,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(fontSize: 12, color: Color(0xffA9ACB0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButtons(Size size) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
           await _sendDataToAPI();

            print("Create tapped");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Page21()));

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
          ),
          child: const Text('Create',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     print("Save as draft tapped");
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color.fromRGBO(71, 70, 70, 1),
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        //     padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 19),
        //   ),
        //   child: const Text('Save as Draft',
        //       style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700)),
        // ),
        const SizedBox(height: 30),
      ],
    );
  }
}
