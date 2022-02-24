// To parse this JSON data, do
//
//     final taskCreateResponseModel = taskCreateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskCreateResponseModel taskCreateResponseModelFromJson(String str) =>
    TaskCreateResponseModel.fromJson(json.decode(str));

String taskCreateResponseModelToJson(TaskCreateResponseModel data) =>
    json.encode(data.toJson());

class TaskCreateResponseModel {
  TaskCreateResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory TaskCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskCreateResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
