// To parse this JSON data, do
//
//     final boardDeleteResponseModel = boardDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

BoardDeleteResponseModel boardDeleteResponseModelFromJson(String str) =>
    BoardDeleteResponseModel.fromJson(json.decode(str));

String boardDeleteResponseModelToJson(BoardDeleteResponseModel data) =>
    json.encode(data.toJson());

class BoardDeleteResponseModel {
  BoardDeleteResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory BoardDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      BoardDeleteResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
