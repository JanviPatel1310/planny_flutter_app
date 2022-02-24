import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomChatClass extends StatefulWidget {
  @override
  _BottomChatClassState createState() => _BottomChatClassState();
}

class _BottomChatClassState extends State<BottomChatClass> {
  AnimationController _controller;

  FocusNode _focusNode = FocusNode();
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavBar();
  }

  Widget _buildBottomNavBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Type new message hear",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.image,
                        ),
                        onPressed: () async {
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);

                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              print(_image.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                        ),
                        onPressed: () async {
                          final pickedFile =
                              await picker.getImage(source: ImageSource.camera);

                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              print(_image.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.upload_file,
                        ),
                        onPressed: () {}),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
