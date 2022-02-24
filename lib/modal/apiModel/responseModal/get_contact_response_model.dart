// To parse this JSON data, do
//
//     final getContactResponseModel = getContactResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

GetContactResponseModel getContactResponseModelFromJson(String str) =>
    GetContactResponseModel.fromJson(json.decode(str));

String getContactResponseModelToJson(GetContactResponseModel data) =>
    json.encode(data.toJson());

class GetContactResponseModel {
  GetContactResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory GetContactResponseModel.fromJson(Map<String, dynamic> json) =>
      GetContactResponseModel(
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
    @required this.contact,
  });

  List<Contact> contact;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        contact:
            List<Contact>.from(json["contact"].map((x) => Contact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contact": List<dynamic>.from(contact.map((x) => x.toJson())),
      };
}

class Contact {
  Contact({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.address,
    @required this.comments,
    @required this.avatar,
    @required this.tags,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.avatarPath,
  });

  int id;
  String name;
  String email;
  String phone;
  dynamic address;
  dynamic comments;
  dynamic avatar;
  dynamic tags;
  dynamic createdAt;
  dynamic updatedAt;
  String avatarPath;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        comments: json["comments"],
        avatar: json["avatar"],
        tags: json["tags"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        avatarPath: json["avatarPath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "comments": comments,
        "avatar": avatar,
        "tags": tags,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "avatarPath": avatarPath,
      };
}
