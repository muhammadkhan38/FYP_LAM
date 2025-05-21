import 'package:final_year_project/Page21.dart';
import 'package:final_year_project/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page4.dart';
import 'SmallText.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  String? _token;

  @override
  void initState() {
    super.initState();
    _loadToken(); // Call _loadToken() in initState
  }

  // Load token from SharedPreferences
  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');

    setState(() {
      _token = token; // Update _token
    });

    if (_token == null || _token!.isEmpty) {
      print("Token is null or empty////////////////////////////////////"); // Print message if token is empty
    } else {
      // Navigate to another screen if token exists
      print("Token:////////////////////////////// $_token"); // Print token for debugging
      // Navigate to another screen, e.g., HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Page21()), // Replace with your next screen
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      body: Center(
        child: _token == null || _token!.isEmpty
            ? Text('No token found')
            : Text('Token: $_token'),
      ),
    );
  }
}





  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/background image.png'),
        fit: BoxFit.cover,
      )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                padding:
                     const EdgeInsets.only(top: 140,),
                child: SizedBox(
                  height: 164.38,
                  width: screenSize.width - 208,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/nda logo image.svg', // Path to your SVG file
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                ),

               ),
              Padding(
                padding:  const EdgeInsets.only(top: 20),
                child: Center(
                  child: SmallText(
                      text:
                          'Lorem ipsum is simply dummy text of the \n       printing and typesetting industry.',
                      size: 14,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 240,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page4(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.white), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30.0), // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 40,
                        width: screenSize.width/2-35,
                        child: const Center(
                          child: Text('SIGN UP',
                              style: TextStyle(fontSize: 16,color: Color(0xFF00C2FF)),),
                        )), // Text style
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Page3(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFF00C2FF)), // Background color
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Border radius
                        ),
                      ),
                    ),
                    child:  SizedBox(
                        height: 40,
                        width: screenSize.width/2-35,
                        child: const Center(
                          child: Text('LOGIN',
                              style: TextStyle(fontSize: 16,color: Colors.white)),
                        )), // Text style
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
