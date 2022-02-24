import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/requestModal/addUser.dart';
import 'package:plany_app/modal/apiModel/responseModal/addUser.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key key}) : super(key: key);

  @override
  _TaskCreateState createState() => _TaskCreateState();
}

class _TaskCreateState extends State<AddUser> {
  GetUserViewModel getUserViewModel = Get.find();
  TextEditingController _domain = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  EditContactViewModel createTaskViewModel = Get.put(EditContactViewModel());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('Delete', style: TextStyle(color: Colors.blue)),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Save', style: TextStyle(color: Colors.blue)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    AddUserRequestModel model = AddUserRequestModel();
                    model.domain = _domain.text;
                    model.name = _name.text;
                    model.email = _email.text;
                    model.password = _password.text;
                    await createTaskViewModel.addUser(model);
                    if (createTaskViewModel.adduser.status == Status.COMPLETE) {
                      AddUserResponseModel resModel =
                          createTaskViewModel.adduser.data;
                      if (resModel.title == 'Registered success') {
                        Fluttertoast.showToast(
                            msg: resModel.title.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        Future.delayed(Duration(seconds: 1), () async {
                          Get.back();
                          // Navigator.pop(context);
                          getUserViewModel.getUsers();
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg: resModel.title.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please try again",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter domain';
                    }
                    return null;
                  },
                  controller: _domain,
                  decoration: InputDecoration(
                      labelText: 'Domain',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      hintText: "Domain"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      hintText: "Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9."
                            r"!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (emailValid == false) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      hintText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password must be 6 character long';
                    }

                    return null;
                  },
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      hintText: "Password"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
