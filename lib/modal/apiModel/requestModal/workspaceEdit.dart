class UpdateWorkspaceRequestModel {
  String name;
  String color;

  UpdateWorkspaceRequestModel({
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
