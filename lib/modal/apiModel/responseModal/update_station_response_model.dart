// To parse this JSON data, do
//
//     final updateStationResponseModel = updateStationResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

UpdateStationResponseModel updateStationResponseModelFromJson(String str) =>
    UpdateStationResponseModel.fromJson(json.decode(str));

String updateStationResponseModelToJson(UpdateStationResponseModel data) =>
    json.encode(data.toJson());

class UpdateStationResponseModel {
  UpdateStationResponseModel({
    @required this.status,
    @required this.title,
  });

  int status;
  String title;

  factory UpdateStationResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateStationResponseModel(
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
      };
}
