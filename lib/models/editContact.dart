// To parse this JSON data, do
//
//     final editContactModel = editContactModelFromJson(jsonString);

import 'dart:convert';

EditContactModel editContactModelFromJson(String str) =>
    EditContactModel.fromJson(json.decode(str));

String editContactModelToJson(EditContactModel data) =>
    json.encode(data.toJson());

class EditContactModel {
  EditContactModel({
    this.status,
    this.title,
  });

  int status;
  String title;

  factory EditContactModel.fromJson(Map<String, dynamic> json) =>
      EditContactModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
