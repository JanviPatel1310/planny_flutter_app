// To parse this JSON data, do
//
//     final boardCreateResponseModel = boardCreateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

BoardCreateResponseModel boardCreateResponseModelFromJson(String str) =>
    BoardCreateResponseModel.fromJson(json.decode(str));

String boardCreateResponseModelToJson(BoardCreateResponseModel data) =>
    json.encode(data.toJson());

class BoardCreateResponseModel {
  BoardCreateResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory BoardCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      BoardCreateResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
