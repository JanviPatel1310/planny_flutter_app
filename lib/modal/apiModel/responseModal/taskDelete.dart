// To parse this JSON data, do
//
//     final taskDeleteResponseModel = taskDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskDeleteResponseModel taskDeleteResponseModelFromJson(String str) =>
    TaskDeleteResponseModel.fromJson(json.decode(str));

String taskDeleteResponseModelToJson(TaskDeleteResponseModel data) =>
    json.encode(data.toJson());

class TaskDeleteResponseModel {
  TaskDeleteResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory TaskDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskDeleteResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
