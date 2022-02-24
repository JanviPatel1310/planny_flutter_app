// To parse this JSON data, do
//
//     final stationListResponseModel = stationListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

StationListResponseModel stationListResponseModelFromJson(String str) =>
    StationListResponseModel.fromJson(json.decode(str));

String stationListResponseModelToJson(StationListResponseModel data) =>
    json.encode(data.toJson());

class StationListResponseModel {
  StationListResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory StationListResponseModel.fromJson(Map<String, dynamic> json) =>
      StationListResponseModel(
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
    @required this.stations,
  });

  List<Station> stations;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
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
