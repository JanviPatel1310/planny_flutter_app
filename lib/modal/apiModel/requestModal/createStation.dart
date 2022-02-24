class CreateStationRequestModel {
  String name;
  String color;

  CreateStationRequestModel({
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
