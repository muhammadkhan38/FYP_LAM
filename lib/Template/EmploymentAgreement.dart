// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class EmploymentAgreement extends StatefulWidget {
//   const EmploymentAgreement({super.key});
//
//   @override
//   _EmploymentAgreementState createState() => _EmploymentAgreementState();
// }
//
// class _EmploymentAgreementState extends State<EmploymentAgreement> {
//   final String defaultTemplate = '''
// Employment Agreement
// This Employment Agreement ("Agreement") is made on this [Insert Date], by and between [Employer’s Name], with a principal address at [Employer’s Address] ("Employer"), and [Employee’s Name], residing at [Employee’s Address] ("Employee").
// WHEREAS, the Employer desires to employ the Employee, and the Employee agrees to such employment under the terms and conditions set forth below, the parties hereby agree as follows:
// 1. Position and Responsibilities
// 1.1. The Employee is employed as [Job Title], reporting to [Supervisor/Manager’s Title].
// 1.2. The Employee’s primary duties include, but are not limited to:
// [List specific responsibilities].
// 1.3. The Employee agrees to perform duties to the best of their abilities and in compliance with company policies.
// 2. Compensation and Benefits
// 2.1. Salary: The Employee shall be paid a gross salary of [Insert Amount and Currency] per [Month/Year], payable in accordance with the Employer’s payroll practices.
// 2.2. Benefits: The Employee is entitled to the following benefits:
// •	[Health Insurance Details]
// •	[Retirement Plan Details]
// •	[Vacation or Paid Leave Details]
// •	[Other Benefits, if applicable].
// 2.3. Deductions will be made for taxes and other contributions required by law.
// 3. Work Schedule
// 3.1. The Employee shall work [Insert Hours, e.g., 9:00 AM to 5:00 PM], Monday to Friday.
// 3.2. Overtime, if required, will be compensated as per [Insert Relevant Laws].
// 3.3. The Employee is entitled to [Insert Number] paid leave days annually.
// 4. Confidentiality
// 4.1. The Employee agrees to maintain the confidentiality of all non-public information pertaining to the Employer’s business, including trade secrets, client details, and proprietary data.
// 4.2. This obligation continues beyond the termination of employment.
// 5. Intellectual Property
// 5.1. Any work product created by the Employee during the course of employment shall be the sole property of the Employer.
// 5.2. The Employee agrees to assign all intellectual property rights arising from such work to the Employer.
// 6. Non-Competition and Non-Solicitation
// 6.1. During employment and for a period of [Insert Time Period] following termination, the Employee shall not engage in business activities that directly compete with the Employer’s business within [Insert Geographic Area].
// 6.2. The Employee shall not solicit the Employer’s clients, employees, or business partners during this period.
// 7. Term and Termination
// 7.1. This Agreement is effective as of [Start Date] and continues until terminated by either party.
// 7.2. Termination may occur:
// •	By Either Party: Upon providing [Notice Period, e.g., 30 days] written notice.
// •	By Employer: Immediately for just cause, including but not limited to misconduct or breach of this Agreement.
// 7.3. Upon termination, the Employee shall return all Employer-owned property, including documents, equipment, and access credentials.
// 8. Dispute Resolution
// 8.1. Any disputes arising from this Agreement shall be resolved through [Insert Dispute Resolution Method, e.g., Arbitration].
// 8.2. The governing law of this Agreement shall be the laws of [Insert Jurisdiction, e.g., Country/State].
// 9. Entire Agreement
// 9.1. This Agreement represents the entire understanding between the parties and supersedes all prior agreements.
// 9.2. Amendments to this Agreement must be made in writing and signed by both parties.
// 10. Severability
// 10.1. If any provision of this Agreement is found to be invalid or unenforceable, the remaining provisions shall remain in full force and effect.
// 11. Signatures
// Employer:
// [Employer’s Name]
// [Employer’s Signature]
// Date: [Insert Date]
// Employee:
// [Employee’s Name]
// [Employee’s Signature]
// Date: [Insert Date]
// ''';
//
//   TextEditingController _controller = TextEditingController();
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     loadTemplate();
//   }
//
//   Future<void> loadTemplate() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? savedTemplate = prefs.getString('employmentAgreement');
//       setState(() {
//         _controller.text = savedTemplate ?? defaultTemplate;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _controller.text = defaultTemplate;
//         isLoading = false;
//       });
//     }
//   }
//
//   Future<void> saveTemplate() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('employmentAgreement', _controller.text);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Template saved successfully!')),
//       );
//     } catch (e) {
//       print('Error saving template: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving template!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Employment Agreement'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: saveTemplate,
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: EdgeInsets.all(10.0),
//         child: TextField(
//           controller: _controller,
//           maxLines: null,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Edit the template here',
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmploymentAgreement extends StatefulWidget {
  const EmploymentAgreement({super.key});

  @override
  _EmploymentAgreementState createState() => _EmploymentAgreementState();
}

class _EmploymentAgreementState extends State<EmploymentAgreement> {
  final String defaultTemplate = '''
Employment Agreement

This Employment Agreement ("Agreement") is made on this [Insert Date], by and between [Employer’s Name], with a principal address at [Employer’s Address] ("Employer"), and [Employee’s Name], residing at [Employee’s Address] ("Employee").
WHEREAS, the Employer desires to employ the Employee, and the Employee agrees to such employment under the terms and conditions set forth below, the parties hereby agree as follows:
1. Position and Responsibilities
1.1. The Employee is employed as [Job Title], reporting to [Supervisor/Manager’s Title].
1.2. The Employee’s primary duties include, but are not limited to:
[List specific responsibilities].
1.3. The Employee agrees to perform duties to the best of their abilities and in compliance with company policies.

2. Compensation and Benefits

2.1. Salary: The Employee shall be paid a gross salary of [Insert Amount and Currency] per [Month/Year], payable in accordance with the Employer’s payroll practices.
2.2. Benefits: The Employee is entitled to the following benefits:
•	[Health Insurance Details]
•	[Retirement Plan Details]
•	[Vacation or Paid Leave Details]
•	[Other Benefits, if applicable].
2.3. Deductions will be made for taxes and other contributions required by law.

3. Work Schedule

3.1. The Employee shall work [Insert Hours, e.g., 9:00 AM to 5:00 PM], Monday to Friday.
3.2. Overtime, if required, will be compensated as per [Insert Relevant Laws].
3.3. The Employee is entitled to [Insert Number] paid leave days annually.

4. Confidentiality

4.1. The Employee agrees to maintain the confidentiality of all non-public information pertaining to the Employer’s business, including trade secrets, client details, and proprietary data.
4.2. This obligation continues beyond the termination of employment.

5. Intellectual Property

5.1. Any work product created by the Employee during the course of employment shall be the sole property of the Employer.
5.2. The Employee agrees to assign all intellectual property rights arising from such work to the Employer.

6. Non-Competition and Non-Solicitation

6.1. During employment and for a period of [Insert Time Period] following termination, the Employee shall not engage in business activities that directly compete with the Employer’s business within [Insert Geographic Area].
6.2. The Employee shall not solicit the Employer’s clients, employees, or business partners during this period.

7. Term and Termination

7.1. This Agreement is effective as of [Start Date] and continues until terminated by either party.
7.2. Termination may occur:
•	By Either Party: Upon providing [Notice Period, e.g., 30 days] written notice.
•	By Employer: Immediately for just cause, including but not limited to misconduct or breach of this Agreement.
7.3. Upon termination, the Employee shall return all Employer-owned property, including documents, equipment, and access credentials.

8. Dispute Resolution

8.1. Any disputes arising from this Agreement shall be resolved through [Insert Dispute Resolution Method, e.g., Arbitration].
8.2. The governing law of this Agreement shall be the laws of [Insert Jurisdiction, e.g., Country/State].

9. Entire Agreement

9.1. This Agreement represents the entire understanding between the parties and supersedes all prior agreements.
9.2. Amendments to this Agreement must be made in writing and signed by both parties.

10. Severability

10.1. If any provision of this Agreement is found to be invalid or unenforceable, the remaining provisions shall remain in full force and effect.

11. Signatures

Employer:
[Employer’s Name]
[Employer’s Signature]
Date: [Insert Date]


Employee:
[Employee’s Name]
[Employee’s Signature]
Date: [Insert Date]
''';

  String agreement = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTemplate();
  }

  Future<void> loadTemplate() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedTemplate = prefs.getString('employmentAgreement');
      setState(() {
        agreement = savedTemplate ?? defaultTemplate;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        agreement = defaultTemplate;
        isLoading = false;
      });
    }
  }

  void navigateToEditPage() async {
    final updatedAgreement = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAgreementPage(initialTemplate: agreement),
      ),
    );
    if (updatedAgreement != null) {
      setState(() {
        agreement = updatedAgreement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employment Agreement'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditPage,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Text(defaultTemplate),
        ),
      ),
    );
  }
}

class EditAgreementPage extends StatefulWidget {
  final String initialTemplate;

  const EditAgreementPage({required this.initialTemplate, super.key});

  @override
  _EditAgreementPageState createState() => _EditAgreementPageState();
}

class _EditAgreementPageState extends State<EditAgreementPage> {
  late TextEditingController _controller;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTemplate);
  }

  Future<void> saveToApi(String updatedTemplate) async {
    try {
      setState(() {
        isSaving = true;
      });

      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/save-agreement'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'agreement': updatedTemplate}),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Template saved successfully!')),
        );
        saveLocally(updatedTemplate);
        Navigator.pop(context, updatedTemplate); // Pass updated agreement back
      } else {
        throw Exception('Failed to save template to the API');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save template!')),
      );
    } finally {
      setState(() {
        isSaving = false;
      });
    }
  }

  Future<void> saveLocally(String updatedTemplate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('employmentAgreement', updatedTemplate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Agreement'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              saveToApi(_controller.text);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Edit the agreement here',
                ),
              ),
            ),
            if (isSaving) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
