import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

class SignupController {

  static String url =
      ApiConstants.signUp;

  Future<Map<String, dynamic>> signup({
    required String username,
    required String phone,
    required String password,
    required String otp,
    required int type
  }) async {

    try {

      final response = await http.post(
        Uri.parse(url),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode({
          "username": username,
          "phone": phone,
          "password": password,
          "otp": otp,
          "type": type
        }),
      );

      print(
          "Signup Response: ${response.body}");

      final data =
      jsonDecode(response.body);

      if (response.statusCode == 200) {

        return {
          "status": data["status"],
          "message": data["message"],
        };

      } else {

        return {
          "status": false,
          "message":
          data["message"] ??
              "Signup failed",
        };
      }

    } catch (e) {

      return {
        "status": false,
        "message": e.toString(),
      };
    }
  }
}