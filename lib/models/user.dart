class UserModel {
  int status;
  String title;
  Result result;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];

    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }
}

class Result {
  User user;

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String googleId;
  String createdAt;
  String updatedAt;
  String token;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    googleId = json['google_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['google_id'] = this.googleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    print(data);
    return data;
  }
}
