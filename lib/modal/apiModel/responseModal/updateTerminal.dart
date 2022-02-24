// To parse this JSON data, do
//
//     final updateTerminalResponseModel = updateTerminalResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

UpdateTerminalResponseModel updateTerminalResponseModelFromJson(String str) =>
    UpdateTerminalResponseModel.fromJson(json.decode(str));

String updateTerminalResponseModelToJson(UpdateTerminalResponseModel data) =>
    json.encode(data.toJson());

class UpdateTerminalResponseModel {
  UpdateTerminalResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory UpdateTerminalResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateTerminalResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
