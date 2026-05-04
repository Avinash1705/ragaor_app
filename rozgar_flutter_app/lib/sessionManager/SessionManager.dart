

import '../features/authenticate/models/LoginResponse.dart';

class SessionManager {
  static final SessionManager _instance =
  SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  String? token;
  User? user;

  void saveLogin(LoginResponse response) {
    token = response.token;
    user = response.data;
  }

  void clear() {
    token = null;
    user = null;
  }

  bool get isLoggedIn => token != null;
}