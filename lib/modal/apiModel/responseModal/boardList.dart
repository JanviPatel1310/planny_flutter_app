// To parse this JSON data, do
//
//     final boardListResponseModel = boardListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

BoardListResponseModel boardListResponseModelFromJson(String str) =>
    BoardListResponseModel.fromJson(json.decode(str));

String boardListResponseModelToJson(BoardListResponseModel data) =>
    json.encode(data.toJson());

class BoardListResponseModel {
  BoardListResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory BoardListResponseModel.fromJson(Map<String, dynamic> json) =>
      BoardListResponseModel(
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
    @required this.board,
  });

  List<Board> board;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        board: List<Board>.from(json["board"].map((x) => Board.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "board": List<dynamic>.from(board.map((x) => x.toJson())),
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
    @required this.workspace,
  });

  int id;
  int workspaceId;
  String name;
  String color;
  dynamic createdAt;
  dynamic updatedAt;
  Workspace workspace;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["id"],
        workspaceId: json["workspace_id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        workspace: Workspace.fromJson(json["workspace"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workspace_id": workspaceId,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "workspace": workspace.toJson(),
      };
}

class Workspace {
  Workspace({
    @required this.id,
    @required this.name,
    @required this.color,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int id;
  String name;
  String color;
  dynamic createdAt;
  dynamic updatedAt;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
