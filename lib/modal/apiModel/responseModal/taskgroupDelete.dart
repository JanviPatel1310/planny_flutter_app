// To parse this JSON data, do
//
//     final taskgrouprDeleteResponseModel = taskgrouprDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskgrouprDeleteResponseModel taskgrouprDeleteResponseModelFromJson(
        String str) =>
    TaskgrouprDeleteResponseModel.fromJson(json.decode(str));

String taskgrouprDeleteResponseModelToJson(
        TaskgrouprDeleteResponseModel data) =>
    json.encode(data.toJson());

class TaskgrouprDeleteResponseModel {
  TaskgrouprDeleteResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory TaskgrouprDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskgrouprDeleteResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
