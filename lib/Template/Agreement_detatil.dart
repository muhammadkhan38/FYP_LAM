import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

import '../Widgets/Reusable Date Picker.dart';
import 'Templeate_textfiedl.dart';

class AgreementDatail extends StatefulWidget {
  final istemplet;
  final filename;
  
  AgreementDatail(this.istemplet, this.filename);

  @override
  _AgreementDatailState createState() => _AgreementDatailState();
}

class _AgreementDatailState extends State<AgreementDatail> {
  Map<String, TextEditingController> descriptionController = {};
  Map<String, TextEditingController> descriptionkeyController = {};
 // Map<String, TextEditingController> valuecontrollers = {};
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    //exportBackgroundColor: Colors.white,
    strokeCap: StrokeCap.round, // Defines how stroke edges appear (round, square, etc.)
    strokeJoin: StrokeJoin.round, // Defines how stroke joints appear (round, bevel, etc.)
    onDrawStart: () => print("Drawing started"), // Called when drawing starts
    onDrawEnd: () => print("Drawing ended"), // Called when drawing ends

  );

  // void _clearSignature() {
  //   _controller.clear();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Map<String, dynamic>? agreementData;
  Map<String, String>? description;
  final  whareas = '';

  bool isEditing = false; // To track edit mode

  TextEditingController titleController = TextEditingController();
  TextEditingController party1Controller = TextEditingController();
  TextEditingController party2Controller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController slugController = TextEditingController();





  @override
  void initState() {
    loadAgreementJson();
    super.initState();
  }
  Future<void> loadAgreementJson() async {
    String jsonString;
    if(widget.istemplet) // boolean variable
      jsonString =  await rootBundle.loadString('assets/'+widget.filename);
    else {
      jsonString = await readJsonFromFiles();
    }
    setState(() {
      // String jsonString =  readJsonFromFile();
       agreementData = jsonDecode(jsonString);

      // Extract the description map
      Map<String, dynamic> descriptionMap = agreementData!['Agreement']['Description'];
       String slug='';
       titleController.text=agreementData?['Agreement']?['title']??"";
       party1Controller.text=agreementData?['Agreement']?['name1']??"";
       party2Controller.text=agreementData?['Agreement']?['name2']??"";
       dateController.text=agreementData?['Agreement']?['date']??"";
       slug= slugController.text=agreementData?['Agreement']?['Description']['rew']??"";

      // Initialize controllers for each key-value pair
      descriptionMap.forEach((key, value) {
        descriptionController[key] = TextEditingController(text: value.toString());
        descriptionkeyController[key] = TextEditingController(text: key.toString());
      });
    });
  }
  /// **Step 1: Get File Path**
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
        print("⚠️ File does not exist!");
        return "{}"; // Return empty JSON if file is missing
      }
    } catch (e) {
      print("❌ Error reading JSON file: $e");
      return "{}"; // Return empty JSON on error
    }
  }




  Future<void> _sendDataToAPI() async {
    const String apiUrl = "https://Nda.yourailist.com/api/create_agreement"; // Change to your API URL
    String slug = slugController.text;
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
      jsonData["Agreement"]["Description"][key] = controller.text;
    });



    // Convert Map to JSON string
    String jsonString = jsonEncode(jsonData);

    Map<String, dynamic> create_Agrement = {

      "email": "mqasimkhan638@gmail.com",
      "slug" : slug,
      "title": titleController.text,
      "agreement_file": jsonString,
      "signature": "true",



    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(create_Agrement),
      );
          print(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        print("Data successfully sent to API!");
      } else {
        print("Failed to send data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending data: $e");
    }
  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Employment Agreement")),
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
                                fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
                          ),

                          Text(
                            'Party 2',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
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



                    // Centered Date TextField
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: CustomTextField(
                          readOnly: true, // ✅ یوزر خود کچھ نہیں لکھ سکتا
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


            SizedBox(height: 30,),
            // Agreement Sections
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
            const SizedBox(
              height: 60,
            ),
            Row(children: [
              const Spacer(),
              Text( "Party 1 ",style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,),),

              const Spacer(
                flex: 3,
              ),
              const Text(
                '00-00-0000',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const Spacer(),
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 123,
                width: size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: const Color(0xffF7F7F7),
                  color: Colors.grey.shade300,
                  //color: Colors.pinkAccent,
                ),
                child: Column(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10.0, right: 10),
                          child: CircleAvatar(
                              backgroundColor: const Color(0xff474646),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.qr_code_scanner,
                                    color: Colors.lightBlueAccent,
                                  ))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Signature of First party',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA9ACB0)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            Row(children: [
              const Spacer(),
              Text( " second party ",style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,),),
              const Spacer(
                flex: 3,
              ),
              const Text(
                '00-00-0000',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Spacer(),
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // height: 123,
                width: size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: const Color(0xffF7F7F7),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Signature(
                        controller: _controller,

                        height: 123,
                        backgroundColor: Colors.grey.shade300,

                        dynamicPressureSupported: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Signature of second party',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA9ACB0)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 45,
                width: size.width - 30,
                //width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff474646)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 120,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: '3',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                  text: '/4',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey)),
                            ])),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: const Color(0xff00C2FF),
                        child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _sendDataToAPI();
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Page40()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                // backgroundColor: Colors.blueAccent.shade400,
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                saveTextToJson();

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

            const SizedBox(
              height: 30,
            ),





          ],
        ),
      ),
    );
  }
}









