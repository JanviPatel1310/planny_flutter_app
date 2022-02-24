class EditContactRequestModel {
  String name;
  String phone;
  String email;

  EditContactRequestModel({
    this.name,
    this.phone,
    this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
