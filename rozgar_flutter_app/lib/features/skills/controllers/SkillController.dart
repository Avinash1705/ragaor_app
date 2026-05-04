import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rozgar_flutter_app/utils/ApiConstants.dart';


import '../../../sessionManager/SessionManager.dart';
import '../models/SkillResponse.dart';

class SkillController {
  static final String getSkillsUrl =
      ApiConstants.getSkills;

  static  String saveSkillsUrl =
     ApiConstants.updateUserSkills;

  // existing method
  Future<List<Skill>> getSkills() async {
    final res = await http.get(Uri.parse(getSkillsUrl));

    if (res.statusCode == 200) {
      final jsonData = jsonDecode(res.body);
      final response = SkillResponse.fromJson(jsonData);

      if (response.status) return response.data;
      throw Exception("API status false");
    } else {
      throw Exception("Error ${res.statusCode}");
    }
  }

  // ✅ NEW: save user skills
  Future<bool> saveUserSkills({
    required int userId,
    required List<int> skills,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(saveSkillsUrl),
        headers: {
          "Authorization": "Bearer ${SessionManager().token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "user_id": userId,
          "skills": skills,
        }),
      );

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        return jsonData["status"] == true;
      } else {
        throw Exception("Failed: ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}