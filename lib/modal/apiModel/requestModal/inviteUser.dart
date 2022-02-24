class InviteUserRequestModel {
  String email;

  InviteUserRequestModel({
    this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
