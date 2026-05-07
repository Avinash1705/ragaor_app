import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

class VerifyOtpController {

  static  String url = ApiConstants.verifyOtp;

  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
  }) async {

    try {

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "phone": phone,
          "otp": otp,
        }),
      );

      print("Verify OTP Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {

        return {
          "status": data["status"],
          "message": data["message"],
        };

      } else {

        return {
          "status": false,
          "message": data["message"] ?? "Verification failed",
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