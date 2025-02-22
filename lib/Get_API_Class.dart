import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  
  final String baseUrl = 'https://nda.qeedvance.com/api';

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['users'];

    } else {
      throw Exception('Failed to load users');
    }
  }
}
