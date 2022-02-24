import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany_app/screens/authentication/register.dart';
import 'package:plany_app/screens/bottomsections/home.dart';

class Startover extends StatefulWidget {
  @override
  _StartoverState createState() => _StartoverState();
}

class _StartoverState extends State<Startover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Get.to(Register());
                },
                child: Text(
                  'Start Over',
                  style: TextStyle(fontSize: 20),
                ),
                // foreground
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Image.asset('asset/logo.png'),
            ),
          ),
          Container(
            child: Center(
                child: Text(
              'Plany',
              style: TextStyle(color: Colors.black),
            )),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: Text(
              'What is this\n device for?',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'asset/phone_icon.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tablet Mode\nor terminal',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(Home());
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'asset/cartoon.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'User Mode',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ]),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
