import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class EmploymentAgreement extends StatefulWidget {
  @override
  _EmploymentAgreementState createState() => _EmploymentAgreementState();
}

class _EmploymentAgreementState extends State<EmploymentAgreement> {
  Map<String, dynamic>? agreementData;
  bool isEditing = false; // To track edit mode

  TextEditingController titleController = TextEditingController();
  TextEditingController employerNameController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAgreementJson();
  }

  Future<void> loadAgreementJson() async {
    String jsonString = await rootBundle.loadString('assets/employment_agreement.json');
    setState(() {
      agreementData = jsonDecode(jsonString);

      // Correcting the keys to match the JSON structure
      titleController.text = agreementData!['Agreement']['title'];
      employerNameController.text = agreementData!['Agreement']['parties']['Employer']['name'];
      employeeNameController.text = agreementData!['Agreement']['parties']['Employee']['name'];
      dateController.text = agreementData!['Agreement']['date'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (agreementData == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()), // Show loading indicator
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Employment Agreement")),
      body: Column(
        children: [
          // Top Black Container
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isEditing
                    ? TextField(
                  controller: titleController,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(border: InputBorder.none, hintText: "Agreement Title", hintStyle: TextStyle(color: Colors.white70)),
                )
                    : Text(
                  titleController.text,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isEditing
                        ? Expanded(
                      child: TextField(
                        controller: employerNameController,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(border: InputBorder.none, hintText: "Employer Name", hintStyle: TextStyle(color: Colors.white70)),
                      ),
                    )
                        : Text(
                      employerNameController.text,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    isEditing
                        ? Expanded(
                      child: TextField(
                        controller: employeeNameController,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(border: InputBorder.none, hintText: "Employee Name", hintStyle: TextStyle(color: Colors.white70)),
                      ),
                    )
                        : Text(
                      employeeNameController.text,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                isEditing
                    ? TextField(
                  controller: dateController,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(border: InputBorder.none, hintText: "Date", hintStyle: TextStyle(color: Colors.white70)),
                )
                    : Text(
                  "Date: ${dateController.text}",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Agreement Sections
          Expanded(
            child: ListView.builder(
              itemCount: agreementData!['Agreement']['sections'].length,
              itemBuilder: (context, index) {
                var section = agreementData!['Agreement']['sections'][index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section['title'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      // Handling the content in different formats
                      if (section['content'] is String)
                        Text(
                          section['content'],
                          style: TextStyle(fontSize: 16),
                        )
                      else if (section['content'] is Map)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (section['content']['position'] != null)
                              Text("Position: ${section['content']['position']}", style: TextStyle(fontSize: 16)),
                            if (section['content']['reporting_to'] != null)
                              Text("Reporting To: ${section['content']['reporting_to']}", style: TextStyle(fontSize: 16)),
                            if (section['content']['duties'] != null)
                              Text("Duties: ${section['content']['duties']}", style: TextStyle(fontSize: 16)),
                            if (section['content']['performance'] != null)
                              Text("Performance: ${section['content']['performance']}", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      SizedBox(height: 5),
                      // Handling nested benefits in Compensation and Benefits
                      if (section['content'] is Map && section['content']['benefits'] != null)
                        Column(
                          children: [
                            Text("Health Insurance: ${section['content']['benefits']['health_insurance']}", style: TextStyle(fontSize: 16)),
                            Text("Retirement Plan: ${section['content']['benefits']['retirement_plan']}", style: TextStyle(fontSize: 16)),
                            Text("Vacation Leave: ${section['content']['benefits']['vacation_leave']}", style: TextStyle(fontSize: 16)),
                            Text("Other Benefits: ${section['content']['benefits']['other_benefits']}", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Signature Section
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Employer’s Signature", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 50), // Space for actual signature
                        Text(agreementData!['Agreement']['signatures']['Employer']['name']),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Employee’s Signature", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 50), // Space for actual signature
                        Text(agreementData!['Agreement']['signatures']['Employee']['name']),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("Date: ${agreementData!['Agreement']['signatures']['Employer']['date']}",
                    style: TextStyle(fontSize: 14)),
              ],
            ),
          ),

          // Three Buttons
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Download PDF");
                  },
                  child: Text("Download PDF"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(isEditing ? "Save" : "Edit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Submit Agreement");
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// class EmploymentAgreement extends StatefulWidget {
//   @override
//   _EmploymentAgreementState createState() => _EmploymentAgreementState();
// }
//
// class _EmploymentAgreementState extends State<EmploymentAgreement> {
//   Map<String, dynamic>? agreementData;
//   bool isEditing = false; // To track edit mode
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController employerNameController = TextEditingController();
//   TextEditingController employeeNameController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     loadAgreementJson();
//   }
//
//   Future<void> loadAgreementJson() async {
//     String jsonString = await rootBundle.loadString('assets/employment_agreement.json');
//     setState(() {
//       agreementData = jsonDecode(jsonString);
//       titleController.text = agreementData!['agreement_title'];
//       employerNameController.text = agreementData!['parties']['employer']['name'];
//       employeeNameController.text = agreementData!['parties']['employee']['name'];
//       dateController.text = agreementData!['date'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (agreementData == null) {
//       return Scaffold(
//         body: Center(child: CircularProgressIndicator()), // Show loading indicator
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Employment Agreement")),
//       body: Column(
//         children: [
//           // Top Black Container
//           Container(
//             color: Colors.black,
//             padding: EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 isEditing
//                     ? TextField(
//                   controller: titleController,
//                   style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(border: InputBorder.none, hintText: "Agreement Title", hintStyle: TextStyle(color: Colors.white70)),
//                 )
//                     : Text(
//                   titleController.text,
//                   style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     isEditing
//                         ? Expanded(
//                       child: TextField(
//                         controller: employerNameController,
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                         decoration: InputDecoration(border: InputBorder.none, hintText: "Employer Name", hintStyle: TextStyle(color: Colors.white70)),
//                       ),
//                     )
//                         : Text(
//                       employerNameController.text,
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     isEditing
//                         ? Expanded(
//                       child: TextField(
//                         controller: employeeNameController,
//                         textAlign: TextAlign.right,
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                         decoration: InputDecoration(border: InputBorder.none, hintText: "Employee Name", hintStyle: TextStyle(color: Colors.white70)),
//                       ),
//                     )
//                         : Text(
//                       employeeNameController.text,
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 isEditing
//                     ? TextField(
//                   controller: dateController,
//                   style: TextStyle(color: Colors.white, fontSize: 14),
//                   decoration: InputDecoration(border: InputBorder.none, hintText: "Date", hintStyle: TextStyle(color: Colors.white70)),
//                 )
//                     : Text(
//                   "Date: ${dateController.text}",
//                   style: TextStyle(color: Colors.white, fontSize: 14),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//
//           // Agreement Sections
//           Expanded(
//             child: ListView.builder(
//               itemCount: agreementData!['terms'].length,
//               itemBuilder: (context, index) {
//                 var section = agreementData!['terms'][index];
//                 return Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           section['section'],
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 5),
//                         for (String detail in section['details'])
//                           Padding(
//                             padding: EdgeInsets.only(top: 5),
//                             child: Text(
//                               "• $detail",
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           // Signature Section
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Divider(color: Colors.grey),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "Employer’s Signature",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 50), // Space for actual signature
//                         Text(agreementData!['signatures']['employer']),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Employee’s Signature",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 50), // Space for actual signature
//                         Text(agreementData!['signatures']['employee']),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Date: ${agreementData!['signatures']['date']}",
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//
//           // Three Buttons
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     print("Download PDF");
//                   },
//                   child: Text("Download PDF"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isEditing = !isEditing;
//                     });
//                   },
//                   child: Text(isEditing ? "Save" : "Edit"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     print("Submit Agreement");
//                   },
//                   child: Text("Submit"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
