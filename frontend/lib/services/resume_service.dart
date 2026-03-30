import 'dart:convert';
import 'package:http/http.dart' as http;

class ResumeService {
  final String baseUrl = "http://10.0.2.2:8000/api";

  // Sends resume content to Django for AI suggestions
  Future<String> getAISuggestions(String content, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/ai/suggest/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // JWT protection
      },
      body: jsonEncode({'content': content}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['suggestions'];
    } else {
      throw Exception('Failed to load AI suggestions');
    }
  }
}