// /// **Save Data to JSON File**
// Future<void> _saveDataToJsonFile() async {
//   try {
//     // Create a Map for JSON data
//     Map<String, dynamic> agreementData = {
//       "title": titleController.text,
//       "firstParty": firstPartyController.text,
//       "secondParty": secondPartyController.text,
//       "date": dateController.text,
//       "exclusions": exclusionsController.text,
//       "roi": roiController.text,
//       "cob": cobController.text,
//       "claus": clausController.text,
//       "remedies": remediesController.text,
//       "jurisdiction": jurisdictionController.text,
//       "obligations": obligationsController.text,
//       "isConfidential": isSwitched
//     };
//
//     // Convert Map to JSON string
//     String jsonString = jsonEncode(agreementData);
//
//     // Get the local directory for storing the file
//     Directory directory = await getApplicationDocumentsDirectory();
//     String filePath = '${directory.path}/agreement.json';
//
//     // Write JSON data to file
//     File file = File(filePath);
//     await file.writeAsString(jsonString);
//
//     print("Data successfully saved to JSON file: $filePath");
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Data saved to agreement.json")));
//   } catch (e) {
//     print("Error saving data: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error saving data: $e")));
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON conversion
import 'package:http/http.dart' as http; // HTTP request package
import 'Page_38.dart';
import 'Widgets/Reusable Date Picker.dart';
import 'Widgets/reausable_text_form_field..dart';


class Page36 extends StatefulWidget {
  const Page36({super.key});

  @override
  State<Page36> createState() => _Page36State();
}

class _Page36State extends State<Page36> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController firstPartyController = TextEditingController();
  final TextEditingController secondPartyController = TextEditingController();
  final TextEditingController DateController = TextEditingController();
  final TextEditingController ExclusionsController = TextEditingController();
  final TextEditingController ROIController = TextEditingController();
  final TextEditingController COBController = TextEditingController();
  final TextEditingController clausController = TextEditingController();
  final TextEditingController RemediesController = TextEditingController();
  final TextEditingController JurisdictionController = TextEditingController();
  final TextEditingController ObligationsController = TextEditingController();
  bool isSwitched = true;




    Future<void> _saveDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', titleController.text);
    prefs.setString('firstParty', firstPartyController.text);
    prefs.setString('secondParty', secondPartyController.text);
    prefs.setString('date', DateController.text);
    prefs.setString('exclusions', ExclusionsController.text);
    prefs.setString('roi', ROIController.text);
    prefs.setString('cob', COBController.text);
    prefs.setString('claus', clausController.text);
    prefs.setString('remedies', RemediesController.text);
    prefs.setString('jurisdiction', JurisdictionController.text);
    prefs.setString('obligations', ObligationsController.text);
    prefs.setBool('isConfidential', isSwitched);
  }

  /// ** Save Data Locally in SharedPreferences **
  // Future<void> _saveDataLocally() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   Map<String, dynamic> agreementData = {
  //     "title": titleController.text,
  //     "firstParty": firstPartyController.text,
  //     "secondParty": secondPartyController.text,
  //     "date": DateController.text,
  //     "exclusions": ExclusionsController.text,
  //     "roi": ROIController.text,
  //     "cob": COBController.text,
  //     "claus": clausController.text,
  //     "remedies": RemediesController.text,
  //     "jurisdiction": JurisdictionController.text,
  //     "obligations": ObligationsController.text,
  //     "isConfidential": isSwitched,
  //   };
  //
  //   String jsonString = jsonEncode(agreementData);
  //   await prefs.setString('agreementData', jsonString);
  //   print("Data saved locally: $jsonString");
  // }

  /// **Send JSON Data to API**
  Future<void> _sendDataToAPI() async {
    const String apiUrl = "https://yourapi.com/save-agreement"; // Change to your API URL

    Map<String, dynamic> agreementData = {
      "title": titleController.text,
      "firstParty": firstPartyController.text,
      "secondParty": secondPartyController.text,
      "date": DateController.text,
      "exclusions": ExclusionsController.text,
      "roi": ROIController.text,
      "cob": COBController.text,
      "claus": clausController.text,
      "remedies": RemediesController.text,
      "jurisdiction": JurisdictionController.text,
      "obligations": ObligationsController.text,
      "isConfidential": isSwitched,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(agreementData),
      );

      if (response.statusCode == 200) {
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
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Custom Template',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Form(
           key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Please Fill the Details",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff000000)),
              ),
              const SizedBox(height: 20),
              ReusableListTileWithInput(
                richTextTitle: "Enter Reason for your Agreement:",
                hintText: "Enter reason",
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Reason for Agreement';
                  }
                  return null;
                },
              ),
              ReusableListTileWithInput(
                richTextTitle: "Enter the First Party Name",
                hintText: "First party",
                controller: firstPartyController,
                maxLengthPerLine: 30,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter First Party Name';
                  }
                  return null;
                },
              ),
              ReusableListTileWithInput(
                richTextTitle: "Enter the Second Party Name",
                hintText: "Second party",
                controller: secondPartyController,
                maxLengthPerLine: 30,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Second Party Name';
                  }

                  return null;
                },
              ),
              ReusableListTileWithInput(
                richTextTitle: "Enter the Date of Agreement",
                hintText: "Select Date",
                controller: DateController,
                keyboardType: TextInputType.numberWithOptions(signed: true),
                maxLengthPerLine: 1,
                readOnly: true, // ✅ یوزر خود کچھ نہیں لکھ سکتا
                onTap: () => DatePickerUtil.selectDate(context, DateController),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }


                  return null;
                },
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: size.width - 35,
                child: ListTile(
                  leading: const Text(
                    "Keep Agreement Confidential",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  trailing: Switch.adaptive(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor:
                    isSwitched ? Colors.lightBlue : Colors.lightBlue.shade50,
                  ),
                ),
              ),

          ReusableListTileWithInput(
                richTextTitle: "Exclusions",
                richTextSubtitle: "(Optional)",
                hintText: "Enter exclusions",
                controller: ExclusionsController,
                maxLengthPerLine: 30, validator: (value) {  },
              ),
              ReusableListTileWithInput(

                richTextTitle: "ROI",
                richTextSubtitle: "(Optional)",
                hintText: "Enter return of information",
                controller: ROIController,
                maxLengthPerLine: 30,
              ),
              ReusableListTileWithInput(
                richTextTitle: "Consequences of a breach",
                richTextSubtitle: "(Optional)",
                hintText: "Enter COB",
                controller: COBController,
                maxLengthPerLine: 30, validator: (value) {  },
              ),
              ReusableListTileWithInput(
                richTextTitle: "Jurisdiction",
                richTextSubtitle: "(Optional)",
                hintText: "Enter jurisdiction",
                controller: JurisdictionController,
                maxLengthPerLine: 30,
              ),
              ReusableListTileWithInput(
                richTextTitle: "Non Competition Clause",
                richTextSubtitle: "(Optional)",
                hintText: "Enter claus",
                controller: clausController,
                maxLengthPerLine: 30,
              ),
              ReusableListTileWithInput(
                richTextTitle: "Obligations",
                richTextSubtitle: "(Optional)",
                hintText: "Enter claus",
                controller: ObligationsController,
                maxLengthPerLine: 30, validator: (value) {  },
              ),
              ReusableListTileWithInput(
                richTextTitle: "Remedies",
                hintText: "Enter claus",
                controller: RemediesController,
                maxLengthPerLine: 30, validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Remedies';
                }
                else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Only alphabetic characters are allowed';
                }
                return null;
                return null;

              },
              ),
              const SizedBox(height: 20),



              TextButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                    else{
                   await _saveDataLocally();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Page38()));

                  }

                //  await _sendDataToAPI();

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


