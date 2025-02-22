import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:signature/signature.dart';

import '../Widgets/Reusable Date Picker.dart';
import 'Templeate_textfiedl.dart';

class EmploymentAgreement extends StatefulWidget {
  @override
  _EmploymentAgreementState createState() => _EmploymentAgreementState();
}

class _EmploymentAgreementState extends State<EmploymentAgreement> {
  Map<String, TextEditingController> descriptionController = {};
  Map<String, TextEditingController> valuecontrollers = {};
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

  bool isEditing = false; // To track edit mode

  TextEditingController titleController = TextEditingController();
  TextEditingController employerNameController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();





  @override
  void initState() {
    loadAgreementJson();
    super.initState();
  }
  Future<void> loadAgreementJson() async {
    String jsonString = await rootBundle.loadString('assets/employment_agreement.json');
    setState(() {
      agreementData = jsonDecode(jsonString);

      // Extract the description map
      Map<String, dynamic> descriptionMap = agreementData!['Agreement']['Description'];

      // Initialize controllers for each key-value pair
      descriptionMap.forEach((key, value) {
        descriptionController[key] = TextEditingController(text: key.toString());
        descriptionController[value] = TextEditingController(text: value.toString());
      //  valuecontrollers[value] = TextEditingController(text: value.toString());
      });
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
                                controller: entry.value,

                            ),
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









