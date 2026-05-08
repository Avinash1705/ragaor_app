class LoginResponse {
  final bool status;
  final String message;
  final String token;
  final User data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      data: User.fromJson(json['data']),
    );
  }
}

class User {
  final String id;
  final String username;
  final String phone;
  final String type;

  User({
    required this.id,
    required this.username,
    required this.phone,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      phone: json['phone'],
      type: json['type'],
    );
  }
}