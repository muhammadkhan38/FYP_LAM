// import 'package:flutter/material.dart';
// class GlobalApiClass{
//   Future<void> _sendDataToAPI({int id = 0}) async {
//     const String apiUrl = "https://Nda.yourailist.com/api/create_agreement";
//     try {
//       // Prepare the agreement JSON structure
//       Map<String, dynamic> jsonData = {
//         "Agreement": {
//           "title": titleController.text,
//           "parties": {
//             "Employer": {"name": party1Controller.text},
//             "Employee": {"name": party2Controller.text}
//           },
//           "date": dateController.text,
//           "Description": {}
//         }
//       };
//
//       // Add dynamic description fields
//       descriptionController.forEach((key, controller) {
//         jsonData["Agreement"]["Description"][key] = controller.text;
//       });
//
//       // Convert the Agreement Map to JSON string
//       String jsonString = jsonEncode(jsonData);
//
//       // Prepare final payload for API
//       Map<String, dynamic> createAgreement = {
//         "email": _email,
//         "slug": "slug",
//         "title": titleController.text,
//         "agreement_file": jsonString,
//         "signature": base64Signature,
//         // "signature": "true",
//         "id": id,
//       };
//
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(createAgreement),
//       );
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         print(responseData);
//
//         int agreementId = responseData['agreement_id'];
//         String message = responseData['message'];
//
//         print("Agreement ID: $agreementId");
//         print("Message: $message");
//
//
//         // ✅ Save agreementId to SharedPreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('agreement_id', agreementId);
//         Agreement_id = prefs.getInt('agreement_id')!;
//         print("$Agreement_id the is the share perfersnce is dis ");
//
//         print("Agreement ID saved to SharedPreferences!");
//       } else {
//         print("Failed to send data. Status code: ${response.statusCode}");
//         print("Response Body: ${response.body}");
//       }
//     } catch (e) {
//       print("Error sending data: $e");
//     }
//   }
//
// }
//
