// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'MainScreen.dart';
// import 'Page21.dart';
//
// class SplishScreen extends StatefulWidget {
//   const SplishScreen({super.key});
//
//   @override
//   State<SplishScreen> createState() => _SplishScreenState();
// }
//
// class _SplishScreenState extends State<SplishScreen> {
//   @override
//   String? _token;
//   void loadTimer() {
//     Timer(
//       const Duration(seconds: 3),
//           () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>  MainScreen(),
//         ),
//       ),
//
//     );
//   }
//   Future<void> _loadToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('user_token');
//
//     setState(() {
//       _token = token; // Update _token
//     });
//
//     if (_token == null || _token!.isEmpty) {
//       print("Token is null or empty////////////////////////////////////"); // Print message if token is empty
//     } else {
//       // Navigate to another screen if token exists
//       print("Token:////////////////////////////// $_token"); // Print token for debugging
//       // Navigate to another screen, e.g., HomeScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Page21()), // Replace with your next screen
//       );
//     }
//
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(title: Text('Main Screen')),
//         body: Center(
//           child: _token == null || _token!.isEmpty
//               ? Text('No token found')
//               : Text('Token: $_token'),
//         ),
//       );
//     }
//   }
//
//   void callthefunction() async{
//
//     loadTimer();
//     await _loadToken();
//
//   }
//   @override
//   void initState() {
//     super.initState();
//     // Set a timer to navigate to the main screen after 3 seconds
//     callthefunction();
//
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:  BoxDecoration(
//         image: DecorationImage(
//              image: AssetImage('assets/background image.png'),
//           fit: BoxFit.cover,
//         )
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               'assets/nda logo image.svg',
//               width: 200,  // optional
//               height: 200,
//               // optional
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreen.dart';
import 'Page21.dart';

class SplishScreen extends StatefulWidget {
  const SplishScreen({super.key});

  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');

    if (token != null && token.isNotEmpty) {
      // Navigate to Page21 if token exists
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Page21()),
      );
    } else {
      // Navigate to MainScreen if token is null or empty
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SvgPicture.asset(
            'assets/nda logo image.svg',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

