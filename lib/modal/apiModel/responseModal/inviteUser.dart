// To parse this JSON data, do
//
//     final inviteUserResponseModel = inviteUserResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

InviteUserResponseModel inviteUserResponseModelFromJson(String str) =>
    InviteUserResponseModel.fromJson(json.decode(str));

String inviteUserResponseModelToJson(InviteUserResponseModel data) =>
    json.encode(data.toJson());

class InviteUserResponseModel {
  InviteUserResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory InviteUserResponseModel.fromJson(Map<String, dynamic> json) =>
      InviteUserResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
