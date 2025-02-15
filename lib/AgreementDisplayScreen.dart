import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AgreementDisplayScreen extends StatelessWidget {
  Future<Map<String, String>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = [
      'title',
      'party1',
      'party2',
      'purpose',
      'effectiveDate',
      'definitions',
      'terms',
      'paymentTerms',
      'confidentiality',
      'termination',
      'disputeResolution',
      'governingLaw',
    ];
    final data = Map<String, String>();
    for (var key in keys)  {
      data[key] = prefs.getString(key) ?? '';
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agreement Details')),
      body: FutureBuilder<Map<String, String>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final data = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: data.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: Text(
                      entry.key[0].toUpperCase() + entry.key.substring(1),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(entry.value.isEmpty ? 'Not Provided' : entry.value),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}