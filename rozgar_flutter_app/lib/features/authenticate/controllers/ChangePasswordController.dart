import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

class ChangePasswordController {

  static  String url = ApiConstants.changePassword;

  Future<Map<String, dynamic>> changePassword({
    required String phone,
    required String password,
  }) async {

    try {

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "phone": phone,
          "password": password,
        }),
      );

      print("Change Password Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {

        return {
          "status": data["status"],
          "message": data["message"],
        };

      } else {

        return {
          "status": false,
          "message": data["message"] ?? "Something went wrong",
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