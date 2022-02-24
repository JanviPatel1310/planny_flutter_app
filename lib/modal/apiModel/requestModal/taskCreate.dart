class TaskCreateRequestModel {
  String title;
  String quantity;

  TaskCreateRequestModel({
    this.title,
    this.quantity,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'quantity': quantity,
    };
  }
}
