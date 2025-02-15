// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'AgreementDisplayScreen.dart';
//
// class CustomTextFields extends StatefulWidget {
//   const CustomTextFields({super.key});
//
//   @override
//   _CustomTextFieldsState createState() => _CustomTextFieldsState();
// }
//
// class _CustomTextFieldsState extends State<CustomTextFields> {
//   final _formKey = GlobalKey<FormState>();
//   int _maxLines = 1;
//
//   final Map<String, TextEditingController> controllers = {
//     'title': TextEditingController(),
//     'party1': TextEditingController(),
//     'party2': TextEditingController(),
//     'purpose': TextEditingController(),
//     'effectiveDate': TextEditingController(),
//     'definitions': TextEditingController(),
//     'terms': TextEditingController(),
//     'paymentTerms': TextEditingController(),
//     'confidentiality': TextEditingController(),
//     'termination': TextEditingController(),
//     'disputeResolution': TextEditingController(),
//     'governingLaw': TextEditingController(),
//   };
//
//   Future<void> saveData() async {
//     final prefs = await SharedPreferences.getInstance();
//     controllers.forEach((key, controller) {
//       prefs.setString(key, controller.text);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Agreement Form')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 ...controllers.entries.map((entry) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: TextFormField(
//                       controller: entry.value,
//                       maxLines: _maxLines,
//                       onChanged: (text) {
//                         // Dynamically update max lines based on input length
//                         setState(() {
//                           _maxLines = text.length ~/ 20 + 1; // Adjust the divisor for your needs
//                         });
//                       },
//                       decoration: InputDecoration(
//
//                         labelText:
//                             entry.key[0].toUpperCase() + entry.key.substring(1),
//                         border: const OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter ${entry.key}';
//                         }
//                         return null;
//                       },
//                     ),
//                   );
//                 }).toList(),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       await saveData();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AgreementDisplayScreen()),
//                       );
//                     }
//                   },
//                   child: Text('Save and View'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AgreementDisplayScreen.dart';

class CustomTextFields extends StatefulWidget {
  const CustomTextFields({super.key});

  @override
  _CustomTextFieldsState createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> controllers = {
    'title': TextEditingController(),
    'party1': TextEditingController(),
    'party2': TextEditingController(),
    'purpose': TextEditingController(),
    'effectiveDate': TextEditingController(),
    'definitions': TextEditingController(),
    'terms': TextEditingController(),
    'paymentTerms': TextEditingController(),
    'confidentiality': TextEditingController(),
    'termination': TextEditingController(),
    'disputeResolution': TextEditingController(),
    'governingLaw': TextEditingController(),
  };

  // Map to store maxLines for each field
  final Map<String, int> fieldMaxLines = {};

  @override
  void initState() {
    super.initState();
    // Initialize maxLines for each field
    controllers.keys.forEach((key) {
      fieldMaxLines[key] = 1;
    });
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    controllers.forEach((key, controller) {
      prefs.setString(key, controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agreement Form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ...controllers.entries.map((entry) {
                  final fieldKey = entry.key;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      controller: entry.value,
                      textAlign: TextAlign.start,
                      maxLines: fieldMaxLines[fieldKey],
                      onChanged: (text) {
                        // Dynamically update maxLines only for this field
                        setState(() {
                          fieldMaxLines[fieldKey] = text.length ~/ 30 + 1;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: fieldKey[0].toUpperCase() + fieldKey.substring(1),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter $fieldKey';
                        }
                        return null;
                      },
                    ),
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await saveData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgreementDisplayScreen()),
                      );
                    }
                  },
                  child: const Text('Save and View'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
