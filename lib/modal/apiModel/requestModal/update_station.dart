class UpdateStationRequestModel {
  String name;
  String color;

  UpdateStationRequestModel({
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
