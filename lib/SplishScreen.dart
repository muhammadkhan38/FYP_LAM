// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'MainScreen.dart';
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
//   void initState() {
//     super.initState();
//     // Set a timer to navigate to the main screen after 3 seconds
//     Timer(
//       const Duration(seconds: 6),
//       () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>  MainScreen(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:  BoxDecoration(
//         image: DecorationImage(
//              image: AssetImage('assets/background.png'),
//           fit: BoxFit.cover,
//         )
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(image: AssetImage('assets/logo2.png'))
//           ],
//         ),
//       ),
//     );
//   }
// }