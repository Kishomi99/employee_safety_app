import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String name;
  String email;
  String password;
  String role;
  String? position;
  String currentWorkplace;
  String mobileNumber;
  String gender;
  String? profilePhoto;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.position,
    required this.currentWorkplace,
    required this.mobileNumber,
    required this.gender,
    this.profilePhoto,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        position: json["position"],
        currentWorkplace: json["current_workplace"],
        mobileNumber: json["mobile_number "],
        gender: json['gender'],
        profilePhoto: json['profile_photo'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "position": position,
        "current_workplace": currentWorkplace,
        "mobile_number": mobileNumber,
        'gender': gender,
        'profile_photo': profilePhoto,
      };
}
