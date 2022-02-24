// To parse this JSON data, do
//
//     final userUpdateResponseModel = userUpdateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

UserUpdateResponseModel userUpdateResponseModelFromJson(String str) =>
    UserUpdateResponseModel.fromJson(json.decode(str));

String userUpdateResponseModelToJson(UserUpdateResponseModel data) =>
    json.encode(data.toJson());

class UserUpdateResponseModel {
  UserUpdateResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory UserUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      UserUpdateResponseModel(
        status: json["status"],
        title: json["title"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    @required this.user,
  });

  User user;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.emailVerifiedAt,
    @required this.username,
    @required this.userLevel,
    @required this.avatar,
    @required this.lastLoginAt,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.deletedAt,
    @required this.userCreate,
    @required this.userEdit,
    @required this.userDelete,
    @required this.registrationStatusId,
    @required this.googleId,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String username;
  String userLevel;
  dynamic avatar;
  dynamic lastLoginAt;
  dynamic createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic userCreate;
  dynamic userEdit;
  dynamic userDelete;
  dynamic registrationStatusId;
  String googleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        username: json["username"],
        userLevel: json["user_level"],
        avatar: json["avatar"],
        lastLoginAt: json["last_login_at"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userCreate: json["user_create"],
        userEdit: json["user_edit"],
        userDelete: json["user_delete"],
        registrationStatusId: json["registration_status_id"],
        googleId: json["google_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "username": username,
        "user_level": userLevel,
        "avatar": avatar,
        "last_login_at": lastLoginAt,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "user_create": userCreate,
        "user_edit": userEdit,
        "user_delete": userDelete,
        "registration_status_id": registrationStatusId,
        "google_id": googleId,
      };
}
