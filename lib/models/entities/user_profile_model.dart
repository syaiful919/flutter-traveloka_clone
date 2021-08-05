import 'dart:convert';

UserProfileModel userProfileFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

class UserProfileModel {
  UserProfileModel({
    required this.name,
    required this.points,
    required this.photo,
  });

  String name;
  int points;
  String photo;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        name: json["name"],
        points: json["points"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "points": points,
        "photo": photo,
      };
}
