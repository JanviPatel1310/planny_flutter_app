// To parse this JSON data, do
//
//     final taskEditResponseModel = taskEditResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskEditResponseModel taskEditResponseModelFromJson(String str) =>
    TaskEditResponseModel.fromJson(json.decode(str));

String taskEditResponseModelToJson(TaskEditResponseModel data) =>
    json.encode(data.toJson());

class TaskEditResponseModel {
  TaskEditResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory TaskEditResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskEditResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
