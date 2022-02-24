import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plany_app/screens/stations/station_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StationDetail extends StatefulWidget {
  @override
  _StationDetailState createState() => _StationDetailState();
}
// ignore: unused_element

class _StationDetailState extends State<StationDetail> {
  File _image;
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

  TextEditingController _stationname = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (_stationname.text.isNotEmpty) {
                    prefs.setString('stationname', _stationname.text);
                    Get.to(StationEdit(), arguments: _stationname.text);
                    //Redirect to edit station name
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Enter Station Name',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
        centerTitle: true,
        title: Text(
          'User & Terminals',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
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
              title: Text('Bending Stations'),
              subtitle: Text(
                'Terminal: 3 Users 2',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  _showPicker(context);
                },
                child: const Text(
                  'Change Avatar',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
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
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                    ),
                  ],
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
            // SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                  controller: _stationname,
                  decoration: InputDecoration(
                    label: Text('Friendly Name',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
