class CreateWorkspaceRequestModel {
  String name;
  String color;

  CreateWorkspaceRequestModel({
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
