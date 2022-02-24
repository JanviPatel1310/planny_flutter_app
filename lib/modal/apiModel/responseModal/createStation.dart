// To parse this JSON data, do
//
//     final createStationResModel = createStationResModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

CreateStationResModel createStationResModelFromJson(String str) =>
    CreateStationResModel.fromJson(json.decode(str));

String createStationResModelToJson(CreateStationResModel data) =>
    json.encode(data.toJson());

class CreateStationResModel {
  CreateStationResModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory CreateStationResModel.fromJson(Map<String, dynamic> json) =>
      CreateStationResModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
