// To parse this JSON data, do
//
//     final boardEditResponseModel = boardEditResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

BoardEditResponseModel boardEditResponseModelFromJson(String str) =>
    BoardEditResponseModel.fromJson(json.decode(str));

String boardEditResponseModelToJson(BoardEditResponseModel data) =>
    json.encode(data.toJson());

class BoardEditResponseModel {
  BoardEditResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory BoardEditResponseModel.fromJson(Map<String, dynamic> json) =>
      BoardEditResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
