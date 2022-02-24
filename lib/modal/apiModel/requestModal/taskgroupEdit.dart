class UpdateTaskGroupRequestModel {
  String name;
  String color;

  UpdateTaskGroupRequestModel({
    this.name,
    this.color,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': color,
    };
  }
}
