// To parse this JSON data, do
//
//     final taskgrouprListResponseModel = taskgrouprListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskgrouprListResponseModel taskgrouprListResponseModelFromJson(String str) =>
    TaskgrouprListResponseModel.fromJson(json.decode(str));

String taskgrouprListResponseModelToJson(TaskgrouprListResponseModel data) =>
    json.encode(data.toJson());

class TaskgrouprListResponseModel {
  TaskgrouprListResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory TaskgrouprListResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskgrouprListResponseModel(
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
    @required this.taskGroups,
  });

  List<TaskGroup> taskGroups;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        taskGroups: List<TaskGroup>.from(
            json["taskGroups"].map((x) => TaskGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taskGroups": List<dynamic>.from(taskGroups.map((x) => x.toJson())),
      };
}

class TaskGroup {
  TaskGroup({
    @required this.id,
    @required this.name,
    @required this.color,
    @required this.orderId,
    @required this.boardId,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.board,
  });

  int id;
  String name;
  String color;
  dynamic orderId;
  int boardId;
  DateTime createdAt;
  DateTime updatedAt;
  Board board;

  factory TaskGroup.fromJson(Map<String, dynamic> json) => TaskGroup(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        orderId: json["order_id"],
        boardId: json["board_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        board: Board.fromJson(json["board"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "order_id": orderId,
        "board_id": boardId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "board": board.toJson(),
      };
}

class Board {
  Board({
    @required this.id,
    @required this.workspaceId,
    @required this.name,
    @required this.color,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int id;
  int workspaceId;
  String name;
  String color;
  dynamic createdAt;
  DateTime updatedAt;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["id"],
        workspaceId: json["workspace_id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workspace_id": workspaceId,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
