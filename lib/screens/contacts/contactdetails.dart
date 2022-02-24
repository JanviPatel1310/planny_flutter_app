import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plany_app/modal/apiModel/requestModal/edit_contact_reqModel.dart';
import 'package:plany_app/modal/apiModel/responseModal/edit_contact_response_model.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class ContactDetails extends StatefulWidget {
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  var data = Get.arguments;
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  EditContactViewModel editContactViewModel = Get.put(EditContactViewModel());
  GetUserViewModel getUserViewModel = Get.find();
  File _image;
  @override
  Widget build(BuildContext context) {
    _name.text = data[0];
    _email.text = data[1];
    _phone.text = data[2];
    var id = data[3];

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

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('Delete', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Save', style: TextStyle(color: Colors.blue)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    EditContactRequestModel model = EditContactRequestModel();
                    model.name = _name.text;
                    model.phone = _phone.text;
                    model.email = _email.text;

                    await editContactViewModel.editContact(model, id);
                    if (editContactViewModel.editContactApiResponse.status ==
                        Status.COMPLETE) {
                      EditContactResponseModel resModel =
                          editContactViewModel.editContactApiResponse.data;
                      if (resModel.title == 'success') {
                        Fluttertoast.showToast(
                            msg: resModel.title.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Future.delayed(Duration(seconds: 2), () async {
                          Get.back();
                          await getUserViewModel.getContact();
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
                    // WorkspaceListRepo.editcontactsModel(
                    //   url: Base_URL + edit_contacts + id,
                    //   domain: Domain,
                    //   token: AuthToken,
                    //   name: _name.text,
                    //   email: _email.text,
                    //   phone: _phone.text,
                    //   id: id,
                    // );

                    // Fluttertoast.showToast(
                    //     msg: "Contact Details Updated",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0);
                    // Get.back();
                    // WorkspaceListRepo.contactsModel(
                    //     Base_URL + contacts, AuthToken, Domain);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
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
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      subtitle: Text("Admin   station:Design Depart.."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        controller: _name,
                        decoration: new InputDecoration(
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        controller: _email,
                        decoration: new InputDecoration(
                            hintText: 'Enter E-Mail',
                            labelText: 'Enter E-Mail',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter created date';
                          }
                          return null;
                        },
                        controller: _phone,
                        decoration: new InputDecoration(
                            hintText: 'Enter phone',
                            labelText: 'Enter phone',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
                GetBuilder<EditContactViewModel>(
                  builder: (controller) {
                    if (controller.editContactApiResponse.status ==
                        Status.LOADING) {
                      return Container(
                          height: Get.height,
                          width: Get.width,
                          color: Colors.grey.withOpacity(0.3),
                          child: Center(child: CircularProgressIndicator()));
                    }
                    return SizedBox();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
