// To parse this JSON data, do
//
//     final addUserResponseModel = addUserResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

AddUserResponseModel addUserResponseModelFromJson(String str) =>
    AddUserResponseModel.fromJson(json.decode(str));

String addUserResponseModelToJson(AddUserResponseModel data) =>
    json.encode(data.toJson());

class AddUserResponseModel {
  AddUserResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory AddUserResponseModel.fromJson(Map<String, dynamic> json) =>
      AddUserResponseModel(
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
    @required this.email,
    @required this.updatedAt,
    @required this.createdAt,
    @required this.id,
  });

  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
