class AddUserRequestModel {
  String domain;
  String name;
  String email;
  String password;

  AddUserRequestModel({
    this.domain,
    this.name,
    this.email,
    this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'domain': domain,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
