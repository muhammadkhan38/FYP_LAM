import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:signature/signature.dart';

import 'Templeate_textfiedl.dart';

class EmploymentAgreement extends StatefulWidget {
  @override
  _EmploymentAgreementState createState() => _EmploymentAgreementState();
}

class _EmploymentAgreementState extends State<EmploymentAgreement> {
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
  bool isEditing = false; // To track edit mode

  TextEditingController titleController = TextEditingController();
  TextEditingController employerNameController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController resposnibility = TextEditingController();
  TextEditingController Compensation_and_Benefits = TextEditingController();
  TextEditingController Work_Schedule = TextEditingController();
  TextEditingController Confidentiality = TextEditingController();
  TextEditingController Intellectual_Property = TextEditingController();
  TextEditingController Non_Competition_and_Non_Solicitation = TextEditingController();
  TextEditingController Term_and_Termination = TextEditingController();
  TextEditingController Dispute_Resolution = TextEditingController();
  TextEditingController Entire_Agreement = TextEditingController();
  TextEditingController Severability = TextEditingController();

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

      resposnibility.text = agreementData!['Agreement']['Description']["Position_and_Responsibilities"];
      Compensation_and_Benefits.text = agreementData!['Agreement']['Description']["Compensation_and_Benefits"];
      Confidentiality.text = agreementData!['Agreement']['Description']["Confidentiality"];
      Work_Schedule.text = agreementData!['Agreement']['Description']["Work_Schedule"];
      Intellectual_Property.text = agreementData!['Agreement']['Description']["Intellectual_Property"];
      Non_Competition_and_Non_Solicitation.text = agreementData!['Agreement']['Description']["Non_Competition_and_Non_Solicitation"];


      Term_and_Termination.text = agreementData!['Agreement']['Description']["Term_and_Termination"];
      Dispute_Resolution.text = agreementData!['Agreement']['Description']["Dispute_Resolution"];
      Entire_Agreement.text = agreementData!['Agreement']['Description']["Entire_Agreement"];
      Severability.text = agreementData!['Agreement']['Description']["Severability"];



    });
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
                              controller: employeeNameController,
                              color: const Color(0xff00C2FF),
                              hintText: "Employee's Name",
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: employerNameController,
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomTextField(
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

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    SizedBox(height: 40,),



                    CustomTextField(
                      controller: resposnibility,
                      hintText: "resposnibility",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Compensation_and_Benefits,
                      hintText: "Compensation_and_Benefits",
                      maxLines: 20,
                    ),

                    CustomTextField(
                      controller: Confidentiality,
                      hintText: "Confidentiality",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Work_Schedule,
                      hintText: "",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Intellectual_Property,
                      hintText: "Intellectual_Property",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Non_Competition_and_Non_Solicitation,
                      hintText: "Non_Competition_and_Non_Solicitation",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Term_and_Termination,
                      hintText: "Term_and_Termination",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Dispute_Resolution,
                      hintText: "Dispute_Resolution",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller: Entire_Agreement,
                      hintText: "Entire_Agreement",
                      maxLines: 20,
                    ),
                    CustomTextField(
                      controller:Severability,
                      hintText: "Severability",
                      maxLines: 20,
                    ),




                  ]
                ),
              ),


            // Signature Section


            // Three Buttons
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






// Padding(
//   padding: EdgeInsets.all(10),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: agreementData!['Agreement']['sections'].map<Widget>((section) {
//       return Padding(
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               section['title'],
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             if (section['content'] is String)
//               Text(
//                 section['content'],
//                 style: TextStyle(fontSize: 16),
//               )
//             else if (section['content'] is Map)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (section['content']['position'] != null)
//                     Text("Position: ${section['content']['position']}", style: TextStyle(fontSize: 16)),
//                   if (section['content']['reporting_to'] != null)
//                     Text("Reporting To: ${section['content']['reporting_to']}", style: TextStyle(fontSize: 16)),
//                   if (section['content']['duties'] != null)
//                     Text("Duties: ${section['content']['duties']}", style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             SizedBox(height: 5),
//           ],
//         ),
//       );
//     }).toList(),
//   ),
// ),

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
