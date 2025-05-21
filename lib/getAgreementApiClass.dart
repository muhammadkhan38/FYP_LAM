import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Page21.dart';
import 'Page24.dart';
 // replace with your actual model file

class GetAgreementApi {
  Future<Map<String, String>> loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('user_name') ?? '';
    String email = prefs.getString('user_email') ?? '';
    if (kDebugMode) {
      print("$email  This is Load user info email function");
    }
    return {'name': name, 'email': email};
  }

  Future<List<Agreement>> fetchAgreements(String email, {String status = "draft"}) async {
    final url = Uri.parse('https://nda.yourailist.com/api/getAgreements');
    try {
      print("$email this inside the Fetch Agreement function");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'status': status}),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> list = data['agreements'];
        return list.map((e) => Agreement.fromJson(e)).toList();
      } else {
        throw Exception("Error: ${data['message']}");
      }
    } catch (e) {
      throw Exception("Fetch error: $e");
    }
  }
}
