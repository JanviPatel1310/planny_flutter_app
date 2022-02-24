// To parse this JSON data, do
//
//     final taskListsResponseModel = taskListsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

TaskListsResponseModel taskListsResponseModelFromJson(String str) =>
    TaskListsResponseModel.fromJson(json.decode(str));

String taskListsResponseModelToJson(TaskListsResponseModel data) =>
    json.encode(data.toJson());

class TaskListsResponseModel {
  TaskListsResponseModel({
    @required this.status,
    @required this.title,
    @required this.result,
  });

  int status;
  String title;
  Result result;

  factory TaskListsResponseModel.fromJson(Map<String, dynamic> json) =>
      TaskListsResponseModel(
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
    @required this.task,
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
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.description,
    @required this.progress,
    @required this.targetDateAt,
    @required this.taskStatusId,
    @required this.tags,
    @required this.uploadId,
    @required this.contactId,
    @required this.taskGroupId,
    @required this.motherTaskId,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.taskGroup,
    @required this.taskAssignments,
  });

  int id;
  String title;
  int quantity;
  String description;
  String progress;
  dynamic targetDateAt;
  dynamic taskStatusId;
  dynamic tags;
  dynamic uploadId;
  dynamic contactId;
  dynamic taskGroupId;
  dynamic motherTaskId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic taskGroup;
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        taskGroup: json["task_group"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "task_group": taskGroup,
        "task_assignments": List<dynamic>.from(taskAssignments.map((x) => x)),
      };
}
