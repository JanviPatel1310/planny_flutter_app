class CreateTaskGroupRequestModel {
  String name;
  String color;
  String boardId;

  CreateTaskGroupRequestModel({
    this.name,
    this.color,
    this.boardId,
  });
  Map<String, dynamic> toJson() {
    return {
      'board_id': boardId,
      'name': name,
      'color': color,
    };
  }
}
