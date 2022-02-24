// To parse this JSON data, do
//
//     final terminalListResponseModel = terminalListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TerminalListResponseModel terminalListResponseModelFromJson(String str) =>
    TerminalListResponseModel.fromJson(json.decode(str));

String terminalListResponseModelToJson(TerminalListResponseModel data) =>
    json.encode(data.toJson());

class TerminalListResponseModel {
  TerminalListResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory TerminalListResponseModel.fromJson(Map<String, dynamic> json) =>
      TerminalListResponseModel(
        status: json["status"],
        title: json["title"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    @required this.terminals,
  });

  List<Terminal> terminals;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        terminals: List<Terminal>.from(
            json["terminals"].map((x) => Terminal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "terminals": List<dynamic>.from(terminals.map((x) => x.toJson())),
      };
}

class Terminal {
  Terminal({
    @required this.id,
    @required this.token,
    @required this.frientlyName,
    @required this.registrationStatusId,
    @required this.stationId,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int id;
  String token;
  String frientlyName;
  dynamic registrationStatusId;
  int stationId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
        id: json["id"],
        token: json["token"],
        frientlyName: json["friently_name"],
        registrationStatusId: json["registration_status_id"],
        stationId: json["station_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "friently_name": frientlyName,
        "registration_status_id": registrationStatusId,
        "station_id": stationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
