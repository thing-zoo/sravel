// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.password,
    this.nickname,
    this.gender,
    this.birthday,
  });

  String?email;
  String? password;
  String? nickname;
  String? gender;
  DateTime? birthday;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        nickname: json["nickname"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nickname": nickname,
        "gender": gender,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
      };

  // print properties for debug
  void printProperties() {
    print("email: ${email}\n");
    print("password: ${password}\n");
    // print("nickname: ${ninkname}\n");
  }
}
