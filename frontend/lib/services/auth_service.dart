import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String _baseUrl = "http://10.0.2.2:8000/api";
  final _storage = const FlutterSecureStorage();

  // Matches your POST /api/token/ backend endpoint
  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Store the Digital Passport securely
      await _storage.write(key: 'access_token', value: data['access']);
      await _storage.write(key: 'refresh_token', value: data['refresh']);
      return true;
    }
    return false;
  }
}