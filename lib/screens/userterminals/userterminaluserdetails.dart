import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plany_app/modal/apiModel/requestModal/userUpdate.dart';
import 'package:plany_app/modal/apiModel/responseModal/userUpdate.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/screens/changepassword/change_password.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class EachUserDetails extends StatefulWidget {
  @override
  _EachUserDetailsState createState() => _EachUserDetailsState();
}

class _EachUserDetailsState extends State<EachUserDetails> {
  String dropdownvalue = 'admin';
  String dropdownvalue1 = 'Cuttting Station';
  EditContactViewModel editUserViewModel = Get.put(EditContactViewModel());
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _userName = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var items = [
    'admin',
    'subscriber',
  ];
  var items1 = [
    'Cuttting Station',
    'Accounding station',
    'Assemply station',
    'Bending station',
  ];
  File _image;
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String id = data[2];
    _fullName.text = data[0];
    _email.text = data[3];
    _userName.text = data[4];
    _imgFromCamera() async {
      File image = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = image;
      });
    }

    _imgFromGallery() async {
      File image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = image;
      });
    }

    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Form(
      key: _formKey,
      child: Scaffold(
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
                      UserUpdateRequestModel model = UserUpdateRequestModel();
                      model.name = _fullName.text;
                      model.email = _email.text;
                      model.username = _userName.text;
                      model.user_level = dropdownvalue;
                      await editUserViewModel.editUser(model, id);
                      UserUpdateResponseModel resModel1 =
                          editUserViewModel.editUserResponse.data;
                      if (editUserViewModel.editUserResponse.status ==
                          Status.COMPLETE) {
                        UserUpdateResponseModel resModel =
                            editUserViewModel.editUserResponse.data;
                        if (resModel.status == 200) {
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
                            await getUserViewModel.getUsers();
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
                            msg: 'Please try later',
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
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          // elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
          // centerTitle: true,
          title: Text(
            'User Terminals',
            style: TextStyle(
              color: Colors.black,
              // fontSize: 12,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz, color: Colors.blue),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.blue,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  title: Text(data[0],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "Subscriber",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          _showPicker(context);
                        },
                        child: const Text(
                          'Change Avatar',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        child: const Text(
                          'Remove Avatar',
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ),
                    ]),
                Text(
                  '  Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          controller: _fullName,
                          decoration: InputDecoration(
                            label: Text('Full name',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                      SizedBox(height: 10),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text('E-mail',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                      SizedBox(height: 10),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter user name';
                            }
                            return null;
                          },
                          controller: _userName,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text('user name',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          )),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: DropdownButton(
                          value: dropdownvalue,
                          hint: Text('Select User Level'),
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),

                      // TextField(
                      //     // keyboardType: TextInputType.emailAddress,
                      //     decoration: InputDecoration(
                      //   suffix: Icon(Icons.arrow_drop_down),
                      //   label: Text('user level',
                      //       style: TextStyle(
                      //         color: Colors.grey,
                      //       )),
                      // )),
                      SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        child: DropdownButton(
                          value: dropdownvalue1,
                          hint: Text('Select Station'),
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items1.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownvalue1 = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChangePassword()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Change Password',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('  This user is connected with google Google Acount Name',
                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Image.asset('asset/images.png'),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: Text(
                                'Disconnect your google account',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
                SizedBox(height: 20),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Image.asset('asset/images.png'),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: Text(
                                'Login with your google account',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ]),
        )),
      ),
    );
  }
}
