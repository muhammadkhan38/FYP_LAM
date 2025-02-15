import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Page_38.dart';
import 'Widgets/reausable_text_form_field..dart';

class Page36 extends StatefulWidget {
  const Page36({super.key});

  @override
  State<Page36> createState() => _Page36State();
}

class _Page36State extends State<Page36> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController firstpartyController = TextEditingController();
  final TextEditingController secondpartyController = TextEditingController();
  final TextEditingController DateController = TextEditingController();
  final TextEditingController ExclusionsController = TextEditingController();
  final TextEditingController ROIController = TextEditingController();
  final TextEditingController COBController = TextEditingController();
  final TextEditingController clausController = TextEditingController();
  final TextEditingController RemediesController = TextEditingController();
  final TextEditingController JurisdictionController = TextEditingController();
  final TextEditingController ObligationsController = TextEditingController();
  bool isSwitched = true;

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', titlecontroller.text);
    prefs.setString('firstParty', firstpartyController.text);
    prefs.setString('secondParty', secondpartyController.text);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Custom Template',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 100,



      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please Fill the details",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xff000000)),
            ),
            const Text(
              "Please fill the details bellow",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xffAAAAAA)),
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableListTileWithInput(
              richTextTitle: "Enter Reason for your Agreement:",
              hintText: "Enter reason",
              controller: titlecontroller,

            ),
            ReusableListTileWithInput(
              richTextTitle: "Enter the first party Name",
              hintText: " first party",
              controller: firstpartyController,
              maxLengthPerLine: 30,
            ),
            ReusableListTileWithInput(
              richTextTitle: "Enter the second party Name",
              hintText: "Second party",
              controller: secondpartyController,
              maxLengthPerLine: 30,
            ),
            ReusableListTileWithInput(
              richTextTitle: "Enter the Date of Agreement",
              hintText: "Enter your data",
              controller: DateController,
              maxLengthPerLine: 30,
            ),


            const SizedBox(
              height: 10,
            ),
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
                  activeColor: isSwitched ? Colors.lightBlue : Colors.lightBlue.shade50,
                  inactiveThumbColor: isSwitched ? Colors.green : Colors.lightBlue,
                  inactiveTrackColor: isSwitched ? Colors.green[200] : Colors.lightBlueAccent,
                ),

              ),
            ),
            ReusableListTileWithInput(
              richTextTitle: "Exclusions",
              richTextSubtitle: "(Optional)",
              hintText: "Enter exclusions",
              controller: ExclusionsController,
              maxLengthPerLine: 30,
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
              maxLengthPerLine: 30,
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
              maxLengthPerLine: 30,
            ),
            ReusableListTileWithInput(
              richTextTitle: "Remedies",
              hintText: "Enter claus",
              controller: RemediesController,
              maxLengthPerLine: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                await _saveData();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page38()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              child: const Text(
                'Done',
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










// import 'package:flutter/material.dart';
//
// import 'Page_38.dart';
// import 'Widgets/reausable_text_form_field..dart';
//
// class Page36 extends StatefulWidget {
//   const Page36({super.key});
//
//   @override
//   State<Page36> createState() => _Page36State();
// }
// final TextEditingController titlecontroller = TextEditingController();
//   final TextEditingController firstpartyController = TextEditingController();
//   final TextEditingController secondpartyController = TextEditingController();
//   final TextEditingController ExclusionsController = TextEditingController();
//   final TextEditingController ROIController = TextEditingController();
//   final TextEditingController COBController = TextEditingController();
//   final TextEditingController clausController = TextEditingController();
//   final TextEditingController RemediesController = TextEditingController();
//   final TextEditingController JurisdictionController = TextEditingController();
//   final TextEditingController ObligationsController = TextEditingController();
//   bool isSwitched = true;
// @override
//
//
// class _Page36State extends State<Page36> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 124,
//               padding: EdgeInsets.only(top: 20),
//               color: Colors.white,
//               child: ListTile(
//                 leading:IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.arrow_back_ios)),
//                 title: Text(
//                   'Custom Template',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                 ),
//
//               ),
//             ),
//
//
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Please Fill the details",
//               style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                   color: Color(0xff000000)),
//             ),
//             const Text(
//               "Please fill the details bellow",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   color: Color(0xffAAAAAA)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Enter Reason for your Agreement:",
//               hintText: "Enter reason",
//               controller: titlecontroller,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Enter the first party Name",
//               hintText: " first party",
//               controller: firstpartyController,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Enter the second party Name",
//               hintText: "Second party",
//               controller: secondpartyController,
//               maxLengthPerLine: 30,
//
//             ),
//
//
//             const SizedBox(
//               height: 10,
//             ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//           ),
//           width: size.width - 35,
//           child: ListTile(
//             leading:const Text(
//               "Keep Agreement Confidential",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                   color: Colors.black),
//             ),
//             trailing:Switch.adaptive(
//               value: isSwitched,
//               onChanged: (bool value) {
//                 setState(() {
//                   isSwitched = value;
//                 });
//               },
//               activeColor: isSwitched ? Colors.lightBlue : Colors.lightBlue.shade50,
//               inactiveThumbColor: isSwitched ? Colors.green : Colors.lightBlue,
//               inactiveTrackColor: isSwitched ? Colors.green[200] : Colors.lightBlueAccent,
//             ),
//           ),
//
//         ),
//             ReusableListTileWithInput(
//
//               richTextTitle: "Exclusions",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter exclusions",
//               controller: ExclusionsController,
//               maxLengthPerLine: 30,
//
//             ),
//
//             ReusableListTileWithInput(
//               richTextTitle: "ROI",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter return of information",
//               controller: ROIController,
//               maxLengthPerLine: 30,
//
//             ),
//
//             ReusableListTileWithInput(
//               richTextTitle: "Consequences of a breach",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter COB",
//               controller: COBController,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Jurisdiction",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter jurisdiction",
//               controller: JurisdictionController,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Non Competition Clause",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter claus",
//               controller: clausController,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Obligations",
//               richTextSubtitle: "(Optional)",
//               hintText: "Enter claus",
//               controller: ObligationsController,
//               maxLengthPerLine: 30,
//
//             ),
//             ReusableListTileWithInput(
//               richTextTitle: "Remedies",
//
//               hintText: "Enter claus",
//               controller: RemediesController,
//               maxLengthPerLine: 30,
//
//             ),
//         const SizedBox(
//               height: 20,
//             ),
//
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                     Page38()));
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.blueAccent,
//                // backgroundColor: Colors.blueAccent.shade400,
//                 backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
//               ),
//               child: const Text(
//                 'Done',
//                 style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//
//
//
//
//           ],
//         ),
//
//       ),
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
//
// import 'Page_38.dart';
//
//
// class Page36 extends StatefulWidget {
//   const Page36({super.key});
//
//   @override
//   State<Page36> createState() => _Page36State();
// }
//
// class _Page36State extends State<Page36> {
//   final TextEditingController titlecontroller = TextEditingController();
//   final TextEditingController firstpartyController = TextEditingController();
//   final TextEditingController secondpartyController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController ConfidentiaController = TextEditingController();
//   final TextEditingController exclusionsController = TextEditingController();
//   final TextEditingController returnofinformationController = TextEditingController();
//   bool isSwitched = true;
//   @override
//   Widget build(BuildContext context) {
//
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 124,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   // const SizedBox(width: 10,height: 100,),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back_ios)),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   const Text(
//                     'Custom Template',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Please Fill the details",
//               style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                   color: Color(0xff000000)),
//             ),
//             const Text(
//               "Please fill the details bellow",
//               style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   color: Color(0xffAAAAAA)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(right: 35),
//               child: Text(
//                 "Enter Reason for your Agreement",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Colors.black),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 minLines: 2,
//                 maxLines: 5,
//
//                 maxLength: 25,
//                 controller: titlecontroller,
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter reason',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//
//                   ),
//
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 controller: firstpartyController,
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'First party',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 controller: secondpartyController,
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: '2nd party',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 controller: dateController,
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Date',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 49.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: Row(
//                 children: [
//                   const SizedBox(width: 15,),
//                 const Text(
//                 "Keep Agreement Confidential",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.black),
//               ),
//                   const SizedBox(width: 25,),
//                   Switch.adaptive(
//                     value: isSwitched,
//                     onChanged: (bool value) {
//                       setState(() {
//                         isSwitched = value;
//                       });
//                     },
//                       activeColor: isSwitched ? Colors.lightBlue : Colors.lightBlue.shade50,
//                       inactiveThumbColor: isSwitched ? Colors.green : Colors.lightBlue,
//                       inactiveTrackColor: isSwitched ? Colors.green[200] : Colors.lightBlueAccent,
//                   ),
//
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(right: 150.0),
//               child: Text(
//                 "Agreement Duration",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Color(0xff474646)),
//               ),
//             ),
//             const SizedBox(height: 10,),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//
//                   height: 45,
//                   width: size.width / 2 - 15,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                         hintText: 'From,\t 00-00-000',
//                         hintStyle: TextStyle(color: Color(0xff9DA0AF)),
//
//                         suffixIcon: Icon(
//                           Icons.date_range,
//                           color: Colors.lightBlue,
//                         ),
//                         filled: false,
//                         border: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         contentPadding: EdgeInsets.all(10)
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   height: 45,
//                   width: size.width / 2 - 15,
//
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                         hintText: 'From,\t 00-00-000',
//                         hintStyle: TextStyle(color: Color(0xff9DA0AF)),
//
//                         suffixIcon: Icon(
//                           Icons.date_range,
//                           color: Colors.lightBlue,
//
//
//                         ),
//
//
//                         border: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         contentPadding: EdgeInsets.all(10)
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 100.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Exclusions",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                     TextSpan(
//                         text: ' (Optional)',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffCDCDCD)))
//                   ])),
//             ),
//
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter exclusions',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(right: 145.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "ROI",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter return of information',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Consequences of a breach",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter COB',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(right: 95.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Jurisdiction",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter jurisdiction',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//
//
//             Padding(
//               padding: const EdgeInsets.only(right: 30.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Non Competition Clause",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter clause',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(right: 85.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Obligations",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter clause',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(right: 85.0),
//               child: RichText(
//                   text: const TextSpan(
//                       text: "Obligations",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black),
//                       children: [
//                         TextSpan(
//                             text: ' (Optional)',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffCDCDCD)))
//                       ])),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter clause',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(right: 145.0),
//               child: Text('Remedies'),
//             ),
//
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//               ),
//               width: size.width - 40,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: false,
//                   fillColor: Color(0xffFFFFFF),
//                   hintText: 'Enter clause',
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   border: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                     Page38()));
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.blueAccent,
//                // backgroundColor: Colors.blueAccent.shade400,
//                 backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
//               ),
//               child: const Text(
//                 'Done',
//                 style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
