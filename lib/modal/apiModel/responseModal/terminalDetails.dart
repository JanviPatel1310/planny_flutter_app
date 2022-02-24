// To parse this JSON data, do
//
//     final terminalDetailsResponseModel = terminalDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TerminalDetailsResponseModel terminalDetailsResponseModelFromJson(String str) =>
    TerminalDetailsResponseModel.fromJson(json.decode(str));

String terminalDetailsResponseModelToJson(TerminalDetailsResponseModel data) =>
    json.encode(data.toJson());

class TerminalDetailsResponseModel {
  TerminalDetailsResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory TerminalDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      TerminalDetailsResponseModel(
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
    @required this.terminal,
  });

  List<Terminal> terminal;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        terminal: List<Terminal>.from(
            json["terminal"].map((x) => Terminal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "terminal": List<dynamic>.from(terminal.map((x) => x.toJson())),
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
    @required this.station,
  });

  int id;
  String token;
  String frientlyName;
  dynamic registrationStatusId;
  int stationId;
  DateTime createdAt;
  DateTime updatedAt;
  Station station;

  factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
        id: json["id"],
        token: json["token"],
        frientlyName: json["friently_name"],
        registrationStatusId: json["registration_status_id"],
        stationId: json["station_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        station: Station.fromJson(json["station"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "friently_name": frientlyName,
        "registration_status_id": registrationStatusId,
        "station_id": stationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "station": station.toJson(),
      };
}

class Station {
  Station({
    @required this.id,
    @required this.name,
    @required this.avatar,
    @required this.cost,
    @required this.supervisor,
    @required this.color,
    @required this.uploadTag,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int id;
  String name;
  dynamic avatar;
  String cost;
  dynamic supervisor;
  String color;
  dynamic uploadTag;
  DateTime createdAt;
  DateTime updatedAt;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        cost: json["cost"],
        supervisor: json["supervisor"],
        color: json["color"],
        uploadTag: json["upload_tag"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "cost": cost,
        "supervisor": supervisor,
        "color": color,
        "upload_tag": uploadTag,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
