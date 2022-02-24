class TaskEditRequestModel {
  String title;
  String quantity;
  String progress;

  TaskEditRequestModel({this.title, this.quantity, this.progress});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'quantity': quantity,
      'progress': progress,
    };
  }
}
