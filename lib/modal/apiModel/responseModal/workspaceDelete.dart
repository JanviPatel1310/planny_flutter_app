// To parse this JSON data, do
//
//     final workspaceDeleteResponseModel = workspaceDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

WorkspaceDeleteResponseModel workspaceDeleteResponseModelFromJson(String str) =>
    WorkspaceDeleteResponseModel.fromJson(json.decode(str));

String workspaceDeleteResponseModelToJson(WorkspaceDeleteResponseModel data) =>
    json.encode(data.toJson());

class WorkspaceDeleteResponseModel {
  WorkspaceDeleteResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory WorkspaceDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      WorkspaceDeleteResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
