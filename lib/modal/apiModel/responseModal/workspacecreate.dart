// To parse this JSON data, do
//
//     final workspaceCreateResponseModel = workspaceCreateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

WorkspaceCreateResponseModel workspaceCreateResponseModelFromJson(String str) =>
    WorkspaceCreateResponseModel.fromJson(json.decode(str));

String workspaceCreateResponseModelToJson(WorkspaceCreateResponseModel data) =>
    json.encode(data.toJson());

class WorkspaceCreateResponseModel {
  WorkspaceCreateResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory WorkspaceCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      WorkspaceCreateResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
