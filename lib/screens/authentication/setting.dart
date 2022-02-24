import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:plany_app/controller/user_api_controller.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            )),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                    child: Text(
                      'Settings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, bottom: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Icon(Icons.dark_mode),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Dark Mode', style: TextStyle(fontSize: 17))
                          ],
                        ),
                        FlutterSwitch(
                          width: 75.0,
                          height: 35.0,
                          valueFontSize: 15.0,
                          toggleSize: 25.0,
                          value: status,
                          borderRadius: 25.0,
                          padding: 8.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                              print(status);
                              if (status == true) {
                                Get.changeTheme(ThemeData.dark());
                              } else {
                                Get.changeTheme(ThemeData.light());
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Invite Members'),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Language'),
                    trailing: Text('English'),
                  ),
                  ListTile(
                    onTap: () {
                      UserApiController().deleteAccount(context,
                          idAccount: UserPreferences().id,
                          domain: UserPreferences().domain);
                    },
                    title: Text('Delete Account'),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Terms of services'),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Privacy policy'),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text('Knowledge base'),
                  ),
                  ListTile(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isLoggedIn", false);

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (Route<dynamic> route) => false);
                    },
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Column(
          //       children: [
          //         Icon(
          //           Icons.logout,
          //           size: 30,
          //         ),
          //         TextButton(
          //             child: Text('Start Over'),
          //             onPressed: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (builder) => Startover()));
          //             })
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
