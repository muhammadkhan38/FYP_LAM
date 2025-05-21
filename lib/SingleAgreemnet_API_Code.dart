import 'dart:convert';
import 'package:http/http.dart' as http;

class AgreementServices {
  static const String apiUrl = "https://nda.yourailist.com/api/getSingleAgreement";

  static Future<void> fetchAgreement(int agreemnetId) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "id": agreemnetId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Success! Agreement data:");
        print(data);
        // You can return this data or use it in your widget
      } else {
        print("Error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }
}
