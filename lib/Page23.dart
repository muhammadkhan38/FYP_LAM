import 'dart:convert';

import 'package:final_year_project/page27.dart';
import 'package:final_year_project/page34.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawer_Class.dart';
import 'Page22.dart';
import 'Page24.dart';
import 'Page41.dart';
import 'Show_Single_Agreemnet.dart';

class Page23 extends StatefulWidget {
  const Page23({super.key});

  @override
  State<Page23> createState() => _Page23State();
}


class _Page23State extends State<Page23> {
  List<Agreement> _agreements = [];
bool _loading = true;
String? _error;
String _name = '';
String _email = '';

@override
void initState() {
  super.initState();
  _initialize();
}

Future<void> _initialize() async {
  await _loadUserInfo();
  await _fetchAgreements();
}

Future<void> _loadUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _name = prefs.getString('user_name') ?? '';
    _email = prefs.getString('user_email') ?? '';
  });
}

Future<void> _fetchAgreements() async {
  final url = Uri.parse('https://nda.yourailist.com/api/getAgreements');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _email,
        //'status': "draft",
        'status': "pending",
      }),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> list = data['agreements'];
      setState(() {
        _agreements = list.map((e) => Agreement.fromJson(e)).toList();
        _loading = false;
      });
    } else {
      setState(() {
        _error = "Error: ${data['message']}";
        _loading = false;
      });
    }
  } catch (e) {
    setState(() {
      _error = e.toString();
      _loading = false;
    });
  }
}

// delete agreement API
  Future<void> _deleteAgreements() async {
    final url = Uri.parse('https://nda.yourailist.com/api/deleteAgreements');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          "'agremment": _agreements,
          //'status': "draft",
          //'status': "pending",
        }),
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        print(response.body);


      } else {
        setState(() {
          _error = "Error: ${data['message']}";
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: const Text("Documents",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer:  const DrawerClass(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return Container(
              height: 233,
              width: screenSize.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Page34(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.grey.shade800,), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(40.0),
                          // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 61,
                        width: screenSize.width-90,
                        child: const Center(
                          child: Text("Non Disclosure Agreement",
                              style: TextStyle(color: Colors.white)),
                        )), // Text style
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page27(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.lightBlueAccent,), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(40.0),
                          // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 61,
                        width: screenSize.width-90,
                        child: const Center(
                          child: Text("Consent",
                              style: TextStyle(color: Colors.white)),
                        )), // Text style
                  ),
                ],
              ),
            );
          }
          );
        },
        child:  const Icon(Icons.add,color: Colors.white,size: 35,),
      ),
      bottomNavigationBar:
      ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
        child: BottomAppBar(
          height:75,
          color: Colors.black87,
          notchMargin: 8,
          elevation: 40,
          shape: const CircularNotchedRectangle(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){},
                    icon: const Icon(CupertinoIcons.house_alt),color: Colors.lightBlueAccent,),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page23()));
                  },
                    icon: const Icon(CupertinoIcons.doc_text),color: Colors.grey,),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page22()));
                  },
                    icon: const Icon(CupertinoIcons.bookmark),color: Colors.grey,),
                  IconButton( onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>  const Page41()));
                  },
                    icon: const Icon(CupertinoIcons.person),color: Colors.grey,tooltip: 'file',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: screenSize.width - 25,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.black12, // Border color
                  width: 0.5, // Border width
                ),
              ),
              child: SizedBox(
                width: screenSize.width-25,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),

                    Expanded(
                      child: SizedBox(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.lightBlueAccent,
                            ), // Background color
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                // Border radius
                              ),
                            ),
                          ),
                          onPressed: () {
                          },
                          child: SizedBox(
                              height: 30,
                              width: screenSize.width - 200,
                              child: const Center(
                                child: Text("My Agreement",
                                    style: TextStyle(color: Colors.white)),
                              )), // Text style
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.white,
                        ), // Background color
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            // Border radius
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Page24()));
                      },
                      child: SizedBox(
                          height: 30,
                          width: screenSize.width - 250,
                          child: const Center(
                            child: Text("My Drafts",
                                style: TextStyle(color: Colors.black)),
                          )), // Text style
                    ),
                    //  const Text('My Draft',style: TextStyle(color: Colors.black),
                    // ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // muhammad code
            Column(
              children: [
                _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(child: Text("Error: $_error"))
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _agreements.length,
                  itemBuilder: (context, index) {
                    final agreement = _agreements[index];
                    return GestureDetector(
                      onTap: () {
                        print(agreement.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AgreementPage(id: agreement.id),
                          ),

                        );
                      },
                      child:  Container(
                        padding: const EdgeInsets.only(left: 16.0,bottom: 16),
                        width: screenSize.width - 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side with three text widgets
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15,),
                                Text(agreement.title),
                                Text(agreement.createdAt),
                                const SizedBox(height: 10,),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Received ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff00C2FF),
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '20-01-2023',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff838788),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Right side with two text widgets and two icons




                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                SizedBox(
                                  height: 35,
                                  child: PopupMenuButton<int>(
                                    color: const Color(0xff474646),

                                    icon: const Icon(Icons.more_vert),
                                    // Use more_vert icon

                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                                      PopupMenuItem<int>(
                                        value: 1,
                                        onTap: () {
                                          _showAgreementDialog(context);

                                        },
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Edit Agreement',style: TextStyle(fontSize: 12,color: Colors.white),),
                                            SizedBox(height: 5,),
                                            Divider(
                                              color: Colors.grey, // Customize the color as needed
                                              height: 1,
                                              thickness: 0.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem<int>(
                                        value: 2,
                                        onTap: () {
                                          _sqowAgreementDialogBox(context);

                                        },
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Sign Agreement',style: TextStyle(fontSize: 12,color: Colors.white),),
                                            SizedBox(height: 5,),
                                            Divider(
                                              color: Colors.grey, // Customize the color as needed
                                              height: 1,
                                              thickness: 0.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem<int>(
                                        value: 3,
                                        onTap: () {
                                          _sqowAgreementDialogBox3(context);

                                        },
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Center(child: Text('Decline',style: TextStyle(fontSize: 12,color: Colors.white),)),

                                          ],
                                        ),
                                      ),



                                    ],
                                  ),
                                ),








                                const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text('#1234'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    'Waiting',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Color(0xff00C2FF),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: SizedBox(
                                    width: 76,
                                    height: 33,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        'Sign',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                            ),
                            const SizedBox(height: 10,),

                          ],
                        ),
                      ),
                    );
                  },
                ),

              ],
            ),


            // const SizedBox(height: 20,),
            // Container(
            //   padding: const EdgeInsets.all(16.0),
            //   width: screenSize.width - 20,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //   ),
            //   child: Column(
            //     children: [
            //       const Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               // Left side with three text widgets
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     'Lorem Name',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 14,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Lorem Ipsum Agreement Title',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w700,
            //                       fontSize: 12,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w700,
            //                       fontSize: 10,
            //                     ),
            //                   ),
            //                   SizedBox(height: 20,),
            //                   Column(
            //                     children: [
            //
            //                     ],
            //                   )
            //                 ],
            //               ),
            //               // Right side with two text widgets and two icons
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Icon(Icons.more_vert_outlined),
            //                   SizedBox(height: 3.0), // Space between the rows
            //                   Padding(
            //                     padding: EdgeInsets.only(right: 8.0),
            //                     child: Text('#1234'),
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsets.only(right: 8.0),
            //                     child: Text(
            //                       'Revision',
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w700,
            //                           fontSize: 12,
            //                           color: Color(0xffFF5353)),
            //                     ),
            //                   ),
            //
            //
            //                 ],
            //               ),
            //               SizedBox(height: 20,),
            //
            //
            //
            //             ],
            //           ),
            //         ],
            //       ),
            //       // Container(
            //       //  // height: 123,
            //       //   width: screenSize.width-35,
            //       //   decoration: BoxDecoration(
            //       //       borderRadius: BorderRadius.circular(5),
            //       //       color:const Color(0xffFF5353),
            //       //   ),
            //       //   child: const Padding(
            //       //     padding:  EdgeInsets.all(8.0),
            //       //     child: Column(
            //       //       crossAxisAlignment: CrossAxisAlignment.start,
            //       //       children: [
            //       //         Text('Revisions',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),
            //       //         Text('Lorem Ipsum is simply dummy text of the printing and'
            //       //             ' typesetting industry. Lorem Ipsum has been the industry''s '
            //       //             'standard dummy text ever since the 1500s,',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.white),),
            //       //      SizedBox(height: 8,),
            //       //       ],
            //       //     ),
            //       //   ),
            //       // ),
            //       //
            //       // const SizedBox(height: 10,),
            //       // SizedBox(
            //       //   width: 172,
            //       //   height: 32,
            //       //   child: TextButton(
            //       //     onPressed: (){},
            //       //     style: TextButton.styleFrom(
            //       //       foregroundColor: Colors.white, backgroundColor: Colors.black, // Background color
            //       //     ), child: const Text('Modify',style: TextStyle(fontSize: 12),),
            //       //   ),
            //       // )
            //
            //
            //     ],
            //   ),
            //
            // ),
            //
            //
            // const SizedBox(height: 20,),
            //
            // Container(
            //   padding: const EdgeInsets.all(16.0),
            //   width: screenSize.width - 20,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Left side with three text widgets
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const Text(
            //             'Lorem Name',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w600,
            //               fontSize: 14,
            //             ),
            //           ),
            //           const Text(
            //             'Lorem Ipsum Agreement Title',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 12,
            //             ),
            //           ),
            //           const Text(
            //             'Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 10,
            //             ),
            //           ),
            //           const SizedBox(height: 10,),
            //           RichText(
            //             text: const TextSpan(
            //               text: 'Sent \t',
            //               style: TextStyle(
            //                   fontSize: 12,
            //                   color: Color(0xff00C2FF),
            //                   fontWeight: FontWeight.w500),
            //               children: <TextSpan>[
            //                 TextSpan(
            //                   text: ' 20-01-2023',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w500,
            //                       color: Color(0xff838788),
            //                       fontSize: 12),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       // Right side with two text widgets and two icons
            //       const Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Icon(Icons.more_vert_outlined),
            //           SizedBox(height: 3.0), // Space between the rows
            //           Padding(
            //             padding: EdgeInsets.only(right: 8.0),
            //             child: Text('#1234'),
            //           ),
            //           Padding(
            //             padding: EdgeInsets.only(right: 8.0),
            //             child: Text(
            //               'Completed',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.w900,
            //                   fontSize: 12,
            //                   color: Color(0xff454545)),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //       const SizedBox(height: 10,),
            //
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20,),
            //
            // Container(
            //   padding: const EdgeInsets.all(16.0),
            //   width: screenSize.width - 20,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Left side with three text widgets
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const Text(
            //             'Lorem Name',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w600,
            //               fontSize: 14,
            //             ),
            //           ),
            //           const Text(
            //             'Lorem Ipsum Agreement Title',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 12,
            //             ),
            //           ),
            //           const Text(
            //             'Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.',
            //             style: TextStyle(
            //               fontWeight: FontWeight.w700,
            //               fontSize: 10,
            //             ),
            //           ),
            //           const SizedBox(height: 10,),
            //           RichText(
            //             text: const TextSpan(
            //               text: 'Sent \t',
            //               style: TextStyle(
            //                   fontSize: 12,
            //                   color: Color(0xff00C2FF),
            //                   fontWeight: FontWeight.w500),
            //               children: <TextSpan>[
            //                 TextSpan(
            //                   text: ' 20-01-2023',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.w500,
            //                       color: Color(0xff838788),
            //                       fontSize: 12),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       // Right side with two text widgets and two icons
            //       const Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Icon(Icons.more_vert_outlined),
            //           SizedBox(height: 3.0), // Space between the rows
            //           Padding(
            //             padding: EdgeInsets.only(right: 8.0),
            //             child: Text('#1234'),
            //           ),
            //           Padding(
            //             padding: EdgeInsets.only(right: 8.0),
            //             child: Text(
            //               'Completed',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.w900,
            //                   fontSize: 12,
            //                   color: Color(0xff454545)),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //       const SizedBox(height: 10,),
            //
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }

  void _showAgreementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width*1,

            child: Dialog(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*200,// Set the desired width here
                height: 390,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20,),
                    const Center(
                      child: Text(
                        'Revision Request',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'Request Addition you would like to have',
                        style: TextStyle(fontSize: 12.9, fontWeight: FontWeight.w400,color: Color(0xffA9ACB0)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        ' in the Agreement',
                        style: TextStyle(fontSize: 12.9, fontWeight: FontWeight.w400,color:Color(0xffA9ACB0) ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 148,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF),
                      ),
                      width: MediaQuery.of(context).size.width-20,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: false,
                          fillColor: Color(0xffFFFFFF),
                          hintText: 'Please enter the details here...',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff474646),
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        ),
                        maxLines: 5,
                        // minLines: 3,
                        maxLength: 150,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      ),
                      child: const Text(
                        'Request',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Color(0xffFF5353)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _sqowAgreementDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width*1,

            child: Dialog(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*200,// Set the desired width here
                height: 370 ,
                child:  Column(
                  children: <Widget>[
                    const SizedBox(height: 20,),
                    const Icon(Icons.sentiment_very_dissatisfied,size: 150,color: Colors.lightBlue,),
                    const SizedBox(height: 20,),

                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'Add Signature',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: Color(0xff2A2A2A)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        'Scan your face ID to auto sign the document',
                        style: TextStyle(fontSize: 11.9, fontWeight: FontWeight.w400,color:Color(0xffA9ACB0) ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        backgroundColor: const Color.fromRGBO(15, 104, 251, 1),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                      ),
                      child: const Text(
                        'Sign Document',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),

                    const SizedBox(height: 15,),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        'Sign Manually',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Color(0xff474646)),
                      ),
                    ),
                    const SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _sqowAgreementDialogBox3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(

          child: Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*200,// Set the desired width here

              child:  Column(
                children: <Widget>[
                  const SizedBox(height: 15,),

                  const Icon(Icons.sentiment_very_dissatisfied_sharp,size: 150,color: Colors.lightBlue,),
                  const SizedBox(height: 15,),

                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10),
                    child: Text(
                      'Delete Agreement',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: Color(0xff2A2A2A)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                      'Do you really want to delete the requested ',
                      style: TextStyle(fontSize: 11.9, fontWeight: FontWeight.w400,color:Color(0xffA9ACB0) ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                      'Agreement?',
                      style: TextStyle(fontSize: 11.9, fontWeight: FontWeight.w400,color:Color(0xffA9ACB0) ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                      backgroundColor: const Color.fromRGBO(255, 83, 83, 1),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    ),
                    child: const Text(
                      'Yes, Delete the Agreement',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  const SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                      backgroundColor: const Color.fromRGBO(0, 194, 255, 1),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    child: const Text(
                      'No, Don’t Delete the Agreement',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  const SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
