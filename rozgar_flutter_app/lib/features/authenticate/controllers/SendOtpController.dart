import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

class SendOtpController {

  static  String url = ApiConstants.sendOtp;

  Future<Map<String, dynamic>> sendOtp(String phone) async {

    try {

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "phone": phone,
        }),
      );

      print("OTP Response: ${response.body}");

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
        print("data sendOtp $data");
        return {
          "status": data["status"],
          "message": data["message"],
          "otp": data["otp"],
        };

      } else {

        return {
          "status": false,
          "message": "Failed to send OTP",
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