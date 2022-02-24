// To parse this JSON data, do
//
//     final updateTaskgrouprResponseModel = updateTaskgrouprResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

UpdateTaskgrouprResponseModel updateTaskgrouprResponseModelFromJson(
        String str) =>
    UpdateTaskgrouprResponseModel.fromJson(json.decode(str));

String updateTaskgrouprResponseModelToJson(
        UpdateTaskgrouprResponseModel data) =>
    json.encode(data.toJson());

class UpdateTaskgrouprResponseModel {
  UpdateTaskgrouprResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory UpdateTaskgrouprResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateTaskgrouprResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
