import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';

import '../../../sessionManager/SessionManager.dart';

class ProfileController {
  static  String url =
      ApiConstants.updateUserProfile;

  Future<bool> updateProfile({
    required int userId,
    required String city,
    required String state,
    required String experience,
    File? imageFile,
  }) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));

      /// 🔹 Add fields
      request.fields['user_id'] = userId.toString();
      request.fields['city'] = city;
      request.fields['state'] = state;
      request.fields['experience'] = experience;
      request.headers.addAll({
        "Authorization": "Bearer ${SessionManager().token}",
        "Accept": "application/json",
      });

      /// 🔹 Add image (optional)
      if (imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profile_image',
            imageFile.path,
          ),
        );
      }

      /// 🔹 Send request
      var response = await request.send();

      final responseBody = await response.stream.bytesToString();
      final jsonData = jsonDecode(responseBody);

      if (response.statusCode == 200 && jsonData['status'] == true) {
        return true;
      } else {
        throw Exception(jsonData['message']);
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}