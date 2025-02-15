// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController idNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   Future<void> registerUser() async {
//     String url = 'https://nda.twizard.io/api/register'; // Replace with your actual API URL
//
//     // try {
//       var response = await http.post(
//         Uri.parse(url),
//         body: {
//           'name': nameController.text,
//           'email': emailController.text,
//           'phone_number': phoneNumberController.text,
//           'dob': dobController.text,
//           'id_number': idNumberController.text,
//           'password': passwordController.text,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         // Successful registration
//         var responseData = json.decode(response.body);
//
//         print('User registered successfully lcoally: ' + responseData['status'].toString());
//         // Handle success as per your application flow
//       } else {
//         // Handle other status codes (422, 500, etc.) as needed
//         var responseData = json.decode(response.body);
//         print('Error registering user: ${responseData['message']}');
//         // Show error message to the user
//       }
//     // } catch (e) {
//     //   // Exception occurred (network error, server error, etc.)
//     //   print('Exception during registration: $e');
//     //   // Show error message to the user
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: phoneNumberController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//               ),
//               TextField(
//                 controller: dobController,
//                 decoration: InputDecoration(labelText: 'Date of Birth'),
//               ),
//               TextField(
//                 controller: idNumberController,
//                 decoration: InputDecoration(labelText: 'ID Number'),
//               ),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: registerUser,
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }