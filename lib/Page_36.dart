import 'package:final_year_project/Page_38.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Widgets/Reusable Date Picker.dart';
import 'Widgets/reausable_text_form_field..dart';

class DynamicTextFormFields extends StatefulWidget {
  @override
  _DynamicTextFormFieldsState createState() => _DynamicTextFormFieldsState();
}

class _DynamicTextFormFieldsState extends State<DynamicTextFormFields> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController firstPartyController = TextEditingController();
  final TextEditingController secondPartyController = TextEditingController();
  final TextEditingController DateController = TextEditingController();


  Map<String, TextEditingController> descriptionController = {};
  Map<String, TextEditingController> descriptionkeyController = {};
  int _counter = 0;

  void _addNewFields({String? keyTitle, String? valueDescription}) {
    setState(() {
      String newKey = 'field_$_counter';
      _counter++;

      descriptionkeyController[newKey] =
          TextEditingController(text: keyTitle ?? '');
      descriptionController[newKey] =
          TextEditingController(text: valueDescription ?? '');
    });
  }

  Future<void> saveFormDataToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('title', titleController.text);
    await prefs.setString('first_party', firstPartyController.text);
    await prefs.setString('second_party', secondPartyController.text);
    await prefs.setString('date', DateController.text);
    // await prefs.setString('terms', TermsandconditionController.text);
    // await prefs.setString('remedies', remediesforbridgeController.text);

    Map<String, String> descriptionData = {};
    descriptionController.forEach((key, value) {
      final descKey = descriptionkeyController[key]?.text ?? 'unknown';
      descriptionData[descKey] = value.text;
    });

    await prefs.setString('descriptions', jsonEncode(descriptionData));
  }

  Future<void> loadFormDataFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    titleController.text = prefs.getString('title') ?? '';
    firstPartyController.text = prefs.getString('first_party') ?? '';
    secondPartyController.text = prefs.getString('second_party') ?? '';
    DateController.text = prefs.getString('date') ?? '';
    // TermsandconditionController.text = prefs.getString('terms') ?? '';
    // remediesforbridgeController.text = prefs.getString('remedies') ?? '';

    String? descJson = prefs.getString('descriptions');
    if (descJson != null) {
      Map<String, dynamic> decoded = jsonDecode(descJson);
      decoded.forEach((key, value) {
        _addNewFields(keyTitle: key, valueDescription: value);
      });
    }
  }



  /// this function is used to clear sharedpref data
  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // or prefs.remove('myKey');
  }

  @override
  void initState() {
    super.initState();
    clearData();
    loadFormDataFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Custom Template')),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _addNewFields,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Please Fill the Details",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff000000))),
            const Text("Please Fill the Details below",
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                    color: Colors.grey)),
            const SizedBox(height: 20),
            ReusableListTileWithInput(
                richTextTitle: "Enter Reason for your Agreement:",
                hintText: "Enter reason",
                controller: titleController),
            ReusableListTileWithInput(
                richTextTitle: "Enter the First Party Name",
                hintText: "First party",
                controller: firstPartyController),
            ReusableListTileWithInput(
                richTextTitle: "Enter the Second Party Name",
                hintText: "Second party",
                controller: secondPartyController),
            ReusableListTileWithInput(
              richTextTitle: "Enter the Date of Agreement",
              hintText: "Select Date",
              controller: DateController,
              readOnly: true,
              onTap: () => DatePickerUtil.selectDate(context, DateController),
            ),
            // ReusableListTileWithInput(
            //     richTextTitle: "Remedies for breach",
            //     hintText: "Remedies",
            //     controller: remediesforbridgeController),
            // ReusableListTileWithInput(
            //     richTextTitle: "Terms & Condition",
            //     hintText: "terms & condition",
            //     controller: TermsandconditionController),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              width: size.width - 35,
              child: ListTile(
                leading: const Text("Keep Agreement Confidential",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black)),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: descriptionController.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        width: size.width - 40,
                        child: TextFormField(
                          controller: descriptionkeyController[entry.key],
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 49.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        width: size.width - 40,
                        child: TextFormField(
                          controller: entry.value,
                          decoration: const InputDecoration(
                            hintText: 'Description',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 49.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              }).toList(),
            ),
            TextButton(
              onPressed: () async {
                await saveFormDataToPrefs();
              // Save data before sending
                await Navigator.push((context),
                    MaterialPageRoute(builder: (context) => Page38()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Text('Done',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    firstPartyController.dispose();
    secondPartyController.dispose();
    DateController.dispose();
    // TermsandconditionController.dispose();
    // remediesforbridgeController.dispose();
    descriptionController.forEach((_, c) => c.dispose());
    descriptionkeyController.forEach((_, c) => c.dispose());
    super.dispose();
  }
}


