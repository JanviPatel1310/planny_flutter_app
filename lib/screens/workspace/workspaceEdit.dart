import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plany_app/modal/apiModel/requestModal/workspaceEdit.dart';
import 'package:plany_app/modal/apiModel/responseModal/createStation.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/screens/widgets/drawer.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class WorkspaceEdit extends StatefulWidget {
  WorkspaceEdit({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WorkspaceEdit> {
  EditContactViewModel editWorksapceViewModel = Get.put(EditContactViewModel());
  var data = Get.arguments;
  File _image;
  TextEditingController _workspacename = new TextEditingController();
  TextEditingController _hexcolor = new TextEditingController();

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

  ColorSwatch _tempMainColor;
  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  void _openColorPicker() async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: _shadeColor,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
        onBack: () => print("Back button pressed"),
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var id = data[1];
    String textColor = ColorToHex(_mainColor).toString();
    _hexcolor.text = textColor;
    final _formKey = GlobalKey<FormState>();
    _workspacename.text = data[0];
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
                    UpdateWorkspaceRequestModel model =
                        UpdateWorkspaceRequestModel();
                    model.name = _workspacename.text;
                    model.color = _hexcolor.text;
                    await editWorksapceViewModel.editWorkspace(model, id);
                    if (editWorksapceViewModel.editWorkspaceResponse.status ==
                        Status.COMPLETE) {
                      CreateStationResModel resModel =
                          editWorksapceViewModel.editWorkspaceResponse.data;
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
                          Get.off(MyDrawers());
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
                  // SharedPreferences prefs =
                  // await SharedPreferences.getInstance();
                  // if (_stationname.text.isNotEmpty) {
                  //   prefs.setString('stationname', _stationname.text);
                  //   Get.to(StationEdit());
                  //   //Redirect to edit station name
                  // } else {
                  //   Fluttertoast.showToast(
                  //       msg: 'Enter Station Name',
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.red,
                  //       textColor: Colors.white,
                  //       fontSize: 16.0);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.blue,
                        )),
                    Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        data[0],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 19),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.blue,
                            size: 35,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    controller: _workspacename,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        hintText: " Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 45,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _mainColor),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 330,
                        child: TextFormField(
                          controller: _hexcolor,
                          onTap: () {
                            _openColorPicker();
                          },
                          decoration: InputDecoration(
                              labelText: 'Cost per hour',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                              hintText: "#FFX"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
