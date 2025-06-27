/// This class defines the variables used in the [login_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? email;
  String? password;
  String? role;
  String? deviceToken;

  LoginModel({this.email, this.password, this.role, this.deviceToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      email: json["email"],
      password: json["password"],
      role: json["role"],
      deviceToken: json["user_device_token"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "role": role,
        "user_device_token": deviceToken
      };
}
