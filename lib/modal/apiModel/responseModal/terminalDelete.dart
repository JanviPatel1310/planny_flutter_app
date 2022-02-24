// To parse this JSON data, do
//
//     final terminalDeleteResponseModel = terminalDeleteResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TerminalDeleteResponseModel terminalDeleteResponseModelFromJson(String str) =>
    TerminalDeleteResponseModel.fromJson(json.decode(str));

String terminalDeleteResponseModelToJson(TerminalDeleteResponseModel data) =>
    json.encode(data.toJson());

class TerminalDeleteResponseModel {
  TerminalDeleteResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory TerminalDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      TerminalDeleteResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
