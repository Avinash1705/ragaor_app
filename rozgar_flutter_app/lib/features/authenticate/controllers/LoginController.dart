import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/LoginResponse.dart';

class LoginController {
  static const String baseUrl =
      "https://teal-donkey-558583.hostingersite.com/api/login.php";

  Future<LoginResponse?> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "phone": phone,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return LoginResponse.fromJson(jsonData);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}