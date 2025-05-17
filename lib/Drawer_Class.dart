import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page3.dart';
import 'Page56.dart';
import 'Page60.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  bool isLoading = false;
  String _name = 'Loading...';
  String _email = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }
// to show user Name and Email
  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('user_name') ?? 'No Name';
      _email = prefs.getString('user_email') ?? 'No Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: Drawer(
        width: screenSize.width-30,

        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration:  BoxDecoration(
                color: Colors.lightBlueAccent,

              ),
              child: Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                          radius: 30,
                      backgroundColor: Colors.white60,
                      child: Icon(Icons.person,size: 35,),
                        // backgroundImage: AssetImage('assets/qasim.png'), //Text
                        ),
                  ),

                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_calendar_sharp, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.person,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.doc_plaintext,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('My Agreements'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.bell,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.heart,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Saved'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.circle_grid_hex_fill,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Membership'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page56()));
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.bag_fill,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Payment Methods'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page60()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Divider(color: Colors.grey.shade400),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.question_circle,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('FAQs'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.headphones,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Help Center'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.person_2,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Refer a Friend'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.square_arrow_right,
                color: Colors.lightBlueAccent,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? token = prefs.getString('user_token');
                print("Stored Token ///////////////////////////////////////////////////: $token");

                // Clear the stored token
                await prefs.remove('user_token');

                // Navigate and remove all previous screens
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                      (route) => false,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.qr_code_2,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Generate my QR Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
