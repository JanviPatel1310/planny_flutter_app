// To parse this JSON data, do
//
//     final contactsModel = contactsModelFromJson(jsonString);

import 'dart:convert';

ContactsModel contactsModelFromJson(String str) =>
    ContactsModel.fromJson(json.decode(str));

String contactsModelToJson(ContactsModel data) => json.encode(data.toJson());

class ContactsModel {
  ContactsModel({
    this.status,
    this.title,
    this.result,
  });

  int status;
  String title;
  Result result;

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
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
    this.contact,
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
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.comments,
    this.avatar,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.avatarPath,
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
