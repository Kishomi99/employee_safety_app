class MainUser {
  MainUser({
    required this.id,
    this.name,
    this.email,
    this.role,
    this.userInformation,
    this.referenceNumber,
  });

  final int id;
  final String? name;
  final String? email;
  final String? role;
  final UserInformation? userInformation;
  final String? referenceNumber;

  factory MainUser.fromJson(Map<String, dynamic> json) {
    return MainUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        referenceNumber: json["reference_number"],
        userInformation: json["information"] != null
            ? UserInformation.fromJson(json["information"])
            : null);
  }

  Map<String, dynamic> toJson() => {
        // final data = <String, dynamic>{};
        // if (provinceId != null) {
        //   data['province_id'] = provinceId;
        // }
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "reference_number": referenceNumber,
        "information": userInformation?.toJson(),
      };
}

class UserInformation {
  UserInformation({
    required this.id,
    required this.userId,
    this.position,
    required this.currentWorkplace,
    required this.mobileNumber,
    required this.gender,
    this.profilePhoto,
  });

  final int? id;
  final int? userId;
  final String? position;
  final String? currentWorkplace;
  final String? mobileNumber;
  final String? gender;
  final String? profilePhoto;

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      id: json["id"],
      userId: json["user_id"],
      position: json["position"],
      currentWorkplace: json["current_workplace"],
      mobileNumber: json["mobile_number"],
      gender: json["gender"],
      profilePhoto: json["profile_photo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "position": position,
        "current_workplace": currentWorkplace,
        "mobile_number": mobileNumber,
        "gender": gender,
        "profile_photo": profilePhoto,
      };
}
