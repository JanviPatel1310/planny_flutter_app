// To parse this JSON data, do
//
//     final creatTaskgrouprResponseModel = creatTaskgrouprResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

CreatTaskgrouprResponseModel creatTaskgrouprResponseModelFromJson(String str) =>
    CreatTaskgrouprResponseModel.fromJson(json.decode(str));

String creatTaskgrouprResponseModelToJson(CreatTaskgrouprResponseModel data) =>
    json.encode(data.toJson());

class CreatTaskgrouprResponseModel {
  CreatTaskgrouprResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory CreatTaskgrouprResponseModel.fromJson(Map<String, dynamic> json) =>
      CreatTaskgrouprResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
