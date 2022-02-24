class UserUpdateRequestModel {
  String name;
  String email;
  String username;
  String user_level;

  UserUpdateRequestModel(
      {this.name, this.email, this.user_level, this.username});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'user_level': user_level,
    };
  }
}
