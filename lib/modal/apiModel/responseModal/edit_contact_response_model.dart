class EditContactResponseModel {
  int status;
  String title;

  EditContactResponseModel({this.status, this.title});

  EditContactResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}
