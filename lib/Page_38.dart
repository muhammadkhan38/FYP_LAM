import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

import 'Page_39.dart';
import 'Page_40.dart';

class Page38 extends StatefulWidget {


   Page38({super.key,});

  @override
  State<Page38> createState() => _Page38State();
}

class _Page38State extends State<Page38> {
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
  String title = '';
  String date = '';
  String firstParty = '';
  String secondParty = '';
  String exclusions = '';
  String roi = '';
  String cob = '';
  String claus = '';
  String remedies = '';
  String jurisdiction = '';
  String obligations = '';
  bool isConfidential = false;

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      title = prefs.getString('title') ?? '';
      firstParty = prefs.getString('firstParty') ?? '';
      secondParty = prefs.getString('secondParty') ?? '';
      date = prefs.getString('date') ?? '';
      exclusions = prefs.getString('exclusions') ?? '';
      roi = prefs.getString('roi') ?? '';
      cob = prefs.getString('cob') ?? '';
      claus = prefs.getString('claus') ?? '';
      remedies = prefs.getString('remedies') ?? '';
      jurisdiction = prefs.getString('jurisdiction') ?? '';
      obligations = prefs.getString('obligations') ?? '';
      isConfidential = prefs.getBool('isConfidential') ?? false;
    });
    }
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Agreement (NDA)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 100,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Page39()));
              },
              icon: const Icon(
                Icons.edit_calendar_sharp,
                color: Colors.lightBlueAccent,
              ))

        ],


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(
              height: 15,
            ),
            Container(
            //  padding: EdgeInsets.all(5),
              width: size.width - 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: size.width,
                     // height: 134,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black87),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),


                          Text(title,style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                          Divider(
                            color: Colors.grey.shade600,
                            thickness: 1,
                            indent: 25,
                            endIndent: 25,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Party 1',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text(
                                  'Party 2',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),



                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text( firstParty,style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00C2FF)),),
                                const SizedBox(width: 10,),

                                Text(secondParty,style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00C2FF)),),
                              ],
                            ),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Date:',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: date,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )
                                  ])),
                          const SizedBox(height: 5,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(exclusions,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(roi,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(jurisdiction,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(remedies,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(cob,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(obligations,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Text(claus,style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        // const SizedBox(
                        //   height: 15,
                        // ),

                      ],
                    ),

                  ),

                ],
              ),
            ),



            const SizedBox(
              height: 25,
            ),






            const SizedBox(height: 20,),




            const SizedBox(
              height: 25,
            ),
            Container(
              width: size.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 15,
                  // ),


                  const SizedBox(
                    height: 10,
                  ),




                  const SizedBox(
                    height: 60,
                  ),
                   Row(children: [
                    const Spacer(),
                    Text( "Party 1 $firstParty",style: const TextStyle(
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
                       // color: Colors.grey.shade300,
                       color: Colors.pinkAccent,
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
                    Text( " second party $secondParty",style: const TextStyle(
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
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Page40()));
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

