class BoardCreateRequestModel {
  String workspace_id;
  String name;
  String color;

  BoardCreateRequestModel({
    this.workspace_id,
    this.name,
    this.color,
  });
  Map<String, dynamic> toJson() {
    return {
      'workspace_id': workspace_id,
      'name': name,
      'color': color,
    };
  }
}
