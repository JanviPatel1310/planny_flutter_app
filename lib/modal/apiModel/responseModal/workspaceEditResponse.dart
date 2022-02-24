// To parse this JSON data, do
//
//     final workspaceEditResponseModel = workspaceEditResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

WorkspaceEditResponseModel workspaceEditResponseModelFromJson(String str) =>
    WorkspaceEditResponseModel.fromJson(json.decode(str));

String workspaceEditResponseModelToJson(WorkspaceEditResponseModel data) =>
    json.encode(data.toJson());

class WorkspaceEditResponseModel {
  WorkspaceEditResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory WorkspaceEditResponseModel.fromJson(Map<String, dynamic> json) =>
      WorkspaceEditResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
