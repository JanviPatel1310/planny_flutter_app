// To parse this JSON data, do
//
//     final workspaceModel = workspaceModelFromJson(jsonString);

import 'dart:convert';

WorkspaceModel workspaceModelFromJson(String str) =>
    WorkspaceModel.fromJson(json.decode(str));

String workspaceModelToJson(WorkspaceModel data) => json.encode(data.toJson());

class WorkspaceModel {
  WorkspaceModel({
    this.status,
    this.title,
    this.result,
  });

  int status;
  String title;
  Result result;

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) => WorkspaceModel(
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
    this.workspace,
  });

  List<Workspace> workspace;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        workspace: List<Workspace>.from(
            json["workspace"].map((x) => Workspace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workspace": List<dynamic>.from(workspace.map((x) => x.toJson())),
      };
}

class Workspace {
  Workspace({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.board,
    this.workspaceId,
  });

  int id;
  String name;
  String color;
  DateTime createdAt;
  DateTime updatedAt;
  List<Workspace> board;
  int workspaceId;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        board: json["board"] == null
            ? null
            : List<Workspace>.from(
                json["board"].map((x) => Workspace.fromJson(x))),
        workspaceId: json["workspace_id"] == null ? null : json["workspace_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "board": board == null
            ? null
            : List<dynamic>.from(board.map((x) => x.toJson())),
        "workspace_id": workspaceId == null ? null : workspaceId,
      };
}
