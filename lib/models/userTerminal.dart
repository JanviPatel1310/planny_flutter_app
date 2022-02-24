// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.title,
    this.result,
  });

  int status;
  String title;
  List<Result> result;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        title: json["title"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.username,
    this.userLevel,
    this.avatar,
    this.lastLoginAt,
    //  this.createdAt,
    //  this.updatedAt,
    this.deletedAt,
    this.userCreate,
    this.userEdit,
    this.userDelete,
    this.registrationStatusId,
    this.googleId,
    this.station,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String username;
  String userLevel;
  dynamic avatar;
  dynamic lastLoginAt;
  // DateTime createdAt;
  // DateTime updatedAt;
  dynamic deletedAt;
  dynamic userCreate;
  dynamic userEdit;
  dynamic userDelete;
  dynamic registrationStatusId;
  String googleId;
  dynamic station;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        username: json["username"],
        userLevel: json["user_level"],
        avatar: json["avatar"],
        lastLoginAt: json["last_login_at"],
        // createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userCreate: json["user_create"],
        userEdit: json["user_edit"],
        userDelete: json["user_delete"],
        registrationStatusId: json["registration_status_id"],
        googleId: json["google_id"],
        station: json["station"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "username": username,
        "user_level": userLevel,
        "avatar": avatar,
        "last_login_at": lastLoginAt,
        // "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        // "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "user_create": userCreate,
        "user_edit": userEdit,
        "user_delete": userDelete,
        "registration_status_id": registrationStatusId,
        "google_id": googleId,
        "station": station,
      };
}
