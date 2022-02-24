import 'package:flutter/material.dart';
import 'package:plany_app/controller/user_api_controller.dart';
import 'package:plany_app/models/user.dart';
import 'package:plany_app/preferences/user_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  String Domain, AuthToken, Id;
  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _confirmnewPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await UserPreferences().initPreferences();
    Domain = UserPreferences().domain;
    AuthToken = UserPreferences().token;
    Id = UserPreferences().id.toString();
    print(Domain);
    print(AuthToken);
  }

  void chnagePassword() async {
    UserModel user = await UserApiController().changePassword(context,
        old_pass: _oldPass.text,
        new_pass: _newPass.text,
        confirm_pass: _confirmnewPass.text,
        domain: Domain,
        authToken: AuthToken,
        id: Id);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
          title: Text(
            'Change Password',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old password';
                    }
                    return null;
                  },
                  controller: _oldPass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 5,
                        style: BorderStyle.none,
                      ),
                    ),
                    labelText: "Old password",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    } else if (value.length < 6) {
                      return 'Password must be 6 character long';
                    }
                    return null;
                  },
                  controller: _newPass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 5,
                        style: BorderStyle.none,
                      ),
                    ),
                    labelText: "New password",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter confirm password';
                    } else if (value != _newPass.text) {
                      return 'New password and confirm password dosent match';
                    }
                    return null;
                  },
                  controller: _confirmnewPass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 5,
                        style: BorderStyle.none,
                      ),
                    ),
                    labelText: "Confirm new password",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        chnagePassword();
                      }
                      // chnagePassword();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
