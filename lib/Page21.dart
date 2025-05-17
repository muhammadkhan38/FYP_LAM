import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:final_year_project/page27.dart';
import 'package:final_year_project/page34.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BigText.dart';
import 'Bottom_navigation_Bar.dart';
import 'Drawer_Class.dart';
import 'Show_Single_Agreement.dart';
import 'SmallText.dart';

enum Status {
  complete,
  draft,
  pending,
}
class Agreement {
  final int id;
  final String title;
  final String createdAt;

  Agreement({required this.id, required this.title, required this.createdAt});

  factory Agreement.fromJson(Map<String, dynamic> json) {
    return Agreement(
      id: json['id'],
      title: json['title'],
      createdAt: json['created_at'],
    );
  }
}

class Page21 extends StatefulWidget {

  const Page21({super.key,});

  @override
  State<Page21> createState() => _Page21State();
}

class _Page21State extends State<Page21> {
  int _selectedIndex = 0;


  List<Agreement> _agreements = [];
  bool _loading = true;
  String? _error;
  String _name = '';
  String _email = '';
//  final GetAgreementApi _userService = GetAgreementApi();



  @override
  void initState() {
    super.initState();
    _initialize();

  }
  Future<void> _initialize() async {
    await _loadUserInfo();
    print("$_email this is the init email ");

   // await _userService.fetchAgreements( _email, status: "pending");
   await _fetchAgreements();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('user_name') ?? '';
      _email = prefs.getString('user_email') ?? '';
      print("$_email  This is Load user info email funciton ");

    });
  }


  Future<void> _fetchAgreements() async {
    final url = Uri.parse('https://nda.yourailist.com/api/getAgreements');
    final data;

    try {
      print("$_email this inside the Fetch Agreement function");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          //'status': Status.complete.toString(),
          'status': "complete",
        }),
      );
      data = json.decode(response.body);

      if (response.statusCode == 200) {


        // Now extract the message



        List<dynamic> list = data['agreements'];
        setState(() {
          _agreements = list.map((e) => Agreement.fromJson(e)).toList();
          _loading = false;
        });

      } else {
        setState(() {

          _error = "${data['message']}";
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
    return   Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  SvgPicture.asset('assets/page 21 image.svg'),
        titleSpacing: 90,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            // Adjust the radius
          ),

          backgroundColor: Colors.lightBlueAccent.shade700,
          onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return Container(
                height: 233,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70)),
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
          child:  const Icon(Icons.add,color: Colors.white,size: 35,grade: 40,),
        ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    // bottomNavigationBar:
    //     ClipRRect(
    //       borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
    //       child: BottomAppBar(
    //         height:75,
    //         color: Colors.black87,
    //         notchMargin: 8,
    //         elevation: 40,
    //         shape: const CircularNotchedRectangle(),
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 BottomNavigationBarClass(
    //                   icon: CupertinoIcons.house_alt,
    //                   label: 'Home',
    //                   color: _selectedIndex == 0 ? Colors.grey : Colors.lightBlueAccent,
    //                   onTap: () {
    //                     setState(() {
    //                       _selectedIndex = 0;
    //                     });
    //                   },
    //                 ),
    //                 BottomNavigationBarClass(
    //                   icon: CupertinoIcons.doc_text,
    //                   label: 'Agreements',
    //                   color: _selectedIndex == 0 ? Colors.lightBlueAccent : Colors.grey,
    //                   onTap: () {
    //                     setState(() {
    //                       _selectedIndex = 1;
    //                     });
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page23()));
    //                   },
    //                 ),
    //                 BottomNavigationBarClass(
    //                   icon: CupertinoIcons.bookmark,
    //                   label: 'Saved',
    //                   color: _selectedIndex == 0 ? Colors.lightBlueAccent : Colors.grey,
    //                   onTap: () {
    //                     setState(() {
    //                       _selectedIndex = 1;
    //                     });
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page22()));
    //                   },
    //                 ),
    //                 BottomNavigationBarClass(
    //                   icon: CupertinoIcons.person,
    //                   label: 'Profile',
    //                   color: _selectedIndex == 0 ? Colors.lightBlueAccent : Colors.grey,
    //                   onTap: () {
    //                     setState(() {
    //                       _selectedIndex = 1;
    //                     });
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Page41()));
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: screenSize.width-25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: ListTile(
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person,size: 35,),
                      //  backgroundImage: AssetImage('assets/qasim.png'),
                      ),
                    ),
                    title: Row(
                      children: [
                        SmallText(text: 'Good Morning', color: Colors.grey,size: 12,),
                        const SizedBox(width: 5,),
                        const Icon(Icons.waving_hand,color: Colors.yellow,size: 12,)
                      ],
                    ),
                    trailing: const Icon(CupertinoIcons.bell),
                    subtitle:  Text(_name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),)
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: screenSize.width-25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(10),
                      // Rounded border
                    ),
                    prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey.shade400,),
                    hintText: 'Search',hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: screenSize.width-25,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: BigText(text: "By using APP NDA, you've saved",color: Colors.black,size: 16,),
                    ),
                    const SizedBox(height: 40,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       CircleAvatar(
                         radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.time_solid,color: Colors.lightBlueAccent,),
                       ) ,
                        CircleAvatar(
                          radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.film_fill,color: Colors.lightBlueAccent,),
                       ) ,
                        CircleAvatar(
                          radius: 33,
                         backgroundColor: Colors.black87,
                         child: Icon(CupertinoIcons.doc_plaintext,color: Colors.lightBlueAccent,),
                       )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
               // height: 330,
                width: screenSize.width-10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          BigText(text: 'My Agreements',size: 16,color: Colors.black,),
                          const SizedBox(width: 120,),
                          BigText(text: 'View All',size: 12,color: Colors.lightBlueAccent,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    _loading
                        ? const Center(child: CircularProgressIndicator())
                        : _error != null
                        ? Center(child: Text(" $_error",style: TextStyle(color: Colors.red),))
                        : SizedBox(
                        height: 220,
                          // height: 800,
                          child: ListView.builder(
                            itemCount: _agreements.length,
                            itemBuilder: (context, index) {
                          final agreement = _agreements[index];
                          return GestureDetector(
                            onTap: (){
                              if (kDebugMode) {
                                print(" tap ");
                              }
                              if (kDebugMode) {
                                print(agreement.id);
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AgreementPage(id: agreement.id,)));

                              //AgreementService.fetchAgreement(agreement.id);
                            },
                            child: Container(
                              height: 80,

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(agreement.title),
                                    Text(agreement.createdAt),
                                    // ListTile(
                                    //   title:  Text(" ${agreement.title}"),
                                    //   subtitle: Text("sent  ${agreement.createdAt}"),
                                    //
                                    // ),
                                  //  Text(" ${agreement.id}", style: TextStyle(fontWeight: FontWeight.bold)),


                                  ],
                                ),
                              ),
                            ),
                          );
                                                },
                                              ),
                        ),







































                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}


