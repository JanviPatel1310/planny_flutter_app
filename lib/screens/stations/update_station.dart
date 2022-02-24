import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plany_app/modal/apiModel/requestModal/update_station.dart';
import 'package:plany_app/modal/apiModel/responseModal/update_station_response_model.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class UpdateStation extends StatefulWidget {
  UpdateStation({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UpdateStation> {
  EditContactViewModel editContactViewModel = Get.put(EditContactViewModel());
  var data = Get.arguments;
  File _image;
  TextEditingController _stationname = new TextEditingController();
  TextEditingController _hexcolor = new TextEditingController();
  GetUserViewModel getUserViewModel = Get.find();
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
          onBack: () {
            print('change.........');
          }),
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
    String textColor = ColorToHex(_mainColor).toString();
    _hexcolor.text = textColor;
    final _formKey = GlobalKey<FormState>();
    _stationname.text = data[0];
    // _hexcolor.text = data[1];
    var id = data[3];
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
                    UpdateStationRequestModel model =
                        UpdateStationRequestModel();
                    model.name = _stationname.text;
                    model.color = _hexcolor.text;
                    await editContactViewModel.updateStation(model, id);
                    if (editContactViewModel.updateStationResponse.status ==
                        Status.COMPLETE) {
                      UpdateStationResponseModel resModel =
                          editContactViewModel.updateStationResponse.data;
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
                          await getUserViewModel.getStation();
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
                Divider(
                  thickness: 3,
                  color: Colors.grey.withOpacity(0.2),
                ),
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
                  subtitle: Text("Admin   station:Design Depart.."),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: Text(
                          'Change Avatar',
                          style: TextStyle(
                              color: Colors.blue.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        child: Text(
                          'Remove Avatar',
                          style: TextStyle(
                              color: Colors.blue.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
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
                    controller: _stationname,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        hintText: " Name"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: CircleAvatar(
                    radius: 15,
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
                              color: _mainColor == Colors.blue
                                  ? data[2]
                                  : _mainColor),
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
