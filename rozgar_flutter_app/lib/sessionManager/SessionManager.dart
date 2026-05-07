

import '../features/authenticate/models/LoginResponse.dart';

class SessionManager {
  static final SessionManager _instance =
  SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  String? token;
  User? user;
  /// 🔹 NEW profile fields
  String? city;
  String? state;
  String? experience;
  String? profileImage;

  void saveLogin(LoginResponse response) {
    token = response.token;
    user = response.data;
  }
  /// 🔹 Save profile locally
  void saveProfile({
    required String city,
    required String state,
    required String experience,
    String? image,
  }) {
    this.city = city;
    this.state = state;
    this.experience = experience;
    profileImage = image;
  }


  void clear() {
    token = null;
    user = null;
  }

  bool get isLoggedIn => token != null;
}