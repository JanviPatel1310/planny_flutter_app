// To parse this JSON data, do
//
//     final createTerminalResponseModel = createTerminalResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

CreateTerminalResponseModel createTerminalResponseModelFromJson(String str) =>
    CreateTerminalResponseModel.fromJson(json.decode(str));

String createTerminalResponseModelToJson(CreateTerminalResponseModel data) =>
    json.encode(data.toJson());

class CreateTerminalResponseModel {
  CreateTerminalResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory CreateTerminalResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateTerminalResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
