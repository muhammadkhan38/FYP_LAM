import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Bottom_navigation_Bar.dart';
import 'Drawer_Class.dart';

import 'Page23.dart';
import 'Page41.dart';
import 'Show_Single_Agreement.dart';
import 'Widgets/Reusable_Floating_Action_Button.dart';
import 'getAgreementApiClass.dart';

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

class Page24 extends StatefulWidget {
  const Page24({super.key});

  @override
  State<Page24> createState() => _Page24State();
}

class _Page24State extends State<Page24> {
  List<Agreement> _agreements = [];
  bool _loading = true;
  bool _isLoading = true;
  String? _error;
  String _name = '';
  String _email = '';
  int _selectedIndex = 0;

  final GetAgreementApi _userService = GetAgreementApi();

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
          'status': "draft",
          //'status': "pending",
         //'status': "pending",
        }),
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        print(response.body);
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
      print(e.toString());

      if (e is SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are offline')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }  finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Documents',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 90,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const DrawerClass(),
      backgroundColor: Colors.grey.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 55,
                width: screenSize.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Container(
                      height: 40,
                      width: screenSize.width - 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF00C2FF),
                            Color(0xFF1268FB),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Page23(),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              "My Agreement",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 50),
                    const Text(
                      'My Draft',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  onTap: ()async {

                    print(agreement.id);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          AgreementPage(id: agreement.id, mode: 'edit',),
                    ) );

                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Page40(agreement_ids: agreement.id,),
                    //   ),
                    // );


                  },
                  child: Container(
                    width: screenSize.width - 10,
                    height: 101,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(agreement.title),
                         // Text(agreement.id.toString()),
                          Text(agreement.createdAt),


                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
