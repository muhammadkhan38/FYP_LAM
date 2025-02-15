




// // import 'package:flutter/material.dart';
// //
// // class DynamicFormFieldsScreen extends StatefulWidget {
// //   @override
// //   _DynamicFormFieldsScreenState createState() => _DynamicFormFieldsScreenState();
// // }
// //
// // class _DynamicFormFieldsScreenState extends State<DynamicFormFieldsScreen> {
// //   // List to hold TextEditingControllers for dynamically added fields
// //   final List<TextEditingController> _controllers = [];
// //
// //   @override
// //   void dispose() {
// //     // Dispose all controllers to avoid memory leaks
// //     for (var controller in _controllers) {
// //       controller.dispose();
// //     }
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Dynamic TextFormFields'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _controllers.length,
// //                 itemBuilder: (context, index) {
// //                   return Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                     child: TextFormField(
// //                       controller: _controllers[index],
// //                       decoration: InputDecoration(
// //                         labelText: 'Field ${index + 1}',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   // Add two new controllers for the new TextFormFields
// //                   _controllers.add(TextEditingController());
// //                   _controllers.add(TextEditingController());
// //
// //                 });
// //               },
// //               child: Text('Add TextFormFields'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//





// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class EmploymentAgreement extends StatefulWidget {
//   @override
//   _EmploymentAgreementState createState() => _EmploymentAgreementState();
// }
//
// class _EmploymentAgreementState extends State<EmploymentAgreement> {
//   String defaultTemplate = '''
// Employment Agreement
//
// This Employment Agreement ("Agreement") is made on this [Insert Date], by and between [Employer’s Name], with a principal address at [Employer’s Address] ("Employer"), and [Employee’s Name], residing at [Employee’s Address] ("Employee").
//
// WHEREAS, the Employer desires to employ the Employee, and the Employee agrees to such employment under the terms and conditions set forth below, the parties hereby agree as follows:
//
// 1. Position and Responsibilities
// 1.1. The Employee is employed as [Job Title], reporting to [Supervisor/Manager’s Title].
// 1.2. The Employee’s primary duties include, but are not limited to: [List specific responsibilities].
// 1.3. The Employee agrees to perform duties to the best of their abilities and in compliance with company policies.
//
// 2. Compensation and Benefits
// 2.1. Salary: The Employee shall be paid a gross salary of [Insert Amount and Currency] per [Month/Year], payable in accordance with the Employer’s payroll practices.
// 2.2. Benefits: The Employee is entitled to the following benefits: [Health Insurance Details], [Retirement Plan Details], [Vacation or Paid Leave Details], [Other Benefits, if applicable].
// 2.3. Deductions will be made for taxes and other contributions required by law.
//
// 11. Signatures
// Employer:
// [Employer’s Name]
// [Employer’s Signature]
// Date: [Insert Date]
//
// Employee:
// [Employee’s Name]
// [Employee’s Signature]
// Date: [Insert Date]
// ''';
//
//   TextEditingController _controller = TextEditingController();
//   bool isEditing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadTemplate();
//   }
//
//   Future<void> _loadTemplate() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? savedTemplate = prefs.getString('employmentAgreement');
//     setState(() {
//       _controller.text = savedTemplate ?? defaultTemplate;
//     });
//   }
//
//   Future<void> _saveTemplate() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('employmentAgreement', _controller.text);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Template saved successfully!')),
//     );
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       isEditing = !isEditing;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employment Agreement'),
//         actions: [
//           IconButton(
//             icon: Icon(isEditing ? Icons.visibility : Icons.edit),
//             onPressed: _toggleEditing,
//           ),
//           if (isEditing)
//             IconButton(
//               icon: Icon(Icons.save),
//               onPressed: _saveTemplate,
//             ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: isEditing
//             ? TextField(
//           controller: _controller,
//           maxLines: null,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Edit the template here',
//           ),
//         )
//             : _buildRichText(),
//       ),
//     );
//   }
//
//   Widget _buildRichText() {
//     return SingleChildScrollView(
//       child: RichText(
//         text: TextSpan(
//           style: TextStyle(fontSize: 14.0, color: Colors.black),
//           children: _parseTemplate(_controller.text),
//         ),
//       ),
//     );
//   }
//
//   List<TextSpan> _parseTemplate(String template) {
//     List<TextSpan> spans = [];
//     final lines = template.split('\n');
//     for (var line in lines) {
//       if (line.startsWith('1.') || line.startsWith('2.') || line.startsWith('11.') || line.contains('Agreement')) {
//         spans.add(TextSpan(
//           text: '$line\n',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//         ));
//       } else {
//         spans.add(TextSpan(
//           text: '$line\n',
//           style: TextStyle(fontSize: 14.0),
//         ));
//       }
//     }
//     return spans;
//   }
// }
//
