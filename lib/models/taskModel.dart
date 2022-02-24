// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.status,
    this.title,
    this.result,
  });

  int status;
  String title;
  Result result;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
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
    this.task,
  });

  List<Task> task;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        task: List<Task>.from(json["task"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "task": List<dynamic>.from(task.map((x) => x.toJson())),
      };
}

class Task {
  Task({
    this.id,
    this.title,
    this.quantity,
    this.description,
    this.progress,
    this.targetDateAt,
    this.taskStatusId,
    this.tags,
    this.uploadId,
    this.contactId,
    this.taskGroupId,
    this.motherTaskId,
    this.createdAt,
    this.updatedAt,
    this.taskGroup,
    this.taskAssignments,
  });

  int id;
  String title;
  int quantity;
  dynamic description;
  String progress;
  dynamic targetDateAt;
  dynamic taskStatusId;
  dynamic tags;
  dynamic uploadId;
  dynamic contactId;
  int taskGroupId;
  dynamic motherTaskId;
  dynamic createdAt;
  dynamic updatedAt;
  TaskGroup taskGroup;
  List<dynamic> taskAssignments;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        description: json["description"],
        progress: json["progress"],
        targetDateAt: json["target_date_at"],
        taskStatusId: json["task_status_id"],
        tags: json["tags"],
        uploadId: json["upload_id"],
        contactId: json["contact_id"],
        taskGroupId: json["task_group_id"],
        motherTaskId: json["mother_task_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        taskGroup: TaskGroup.fromJson(json["task_group"]),
        taskAssignments:
            List<dynamic>.from(json["task_assignments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "description": description,
        "progress": progress,
        "target_date_at": targetDateAt,
        "task_status_id": taskStatusId,
        "tags": tags,
        "upload_id": uploadId,
        "contact_id": contactId,
        "task_group_id": taskGroupId,
        "mother_task_id": motherTaskId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "task_group": taskGroup.toJson(),
        "task_assignments": List<dynamic>.from(taskAssignments.map((x) => x)),
      };
}

class TaskGroup {
  TaskGroup({
    this.id,
    this.name,
    this.color,
    this.orderId,
    this.boardId,
    this.createdAt,
    this.updatedAt,
    this.board,
  });

  int id;
  String name;
  String color;
  dynamic orderId;
  int boardId;
  dynamic createdAt;
  dynamic updatedAt;
  Board board;

  factory TaskGroup.fromJson(Map<String, dynamic> json) => TaskGroup(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        orderId: json["order_id"],
        boardId: json["board_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        board: Board.fromJson(json["board"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "order_id": orderId,
        "board_id": boardId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "board": board.toJson(),
      };
}

class Board {
  Board({
    this.id,
    this.workspaceId,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int workspaceId;
  String name;
  String color;
  dynamic createdAt;
  dynamic updatedAt;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["id"],
        workspaceId: json["workspace_id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workspace_id": workspaceId,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
