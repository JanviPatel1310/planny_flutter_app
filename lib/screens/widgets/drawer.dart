import 'package:flutter/material.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:plany_app/screens/authentication/setting.dart';
import 'package:plany_app/screens/bottomsections/chat.dart';
import 'package:plany_app/screens/bottomsections/home.dart';
import 'package:plany_app/screens/bottomsections/menu.dart';
import 'package:plany_app/screens/bottomsections/mywork.dart';
import 'package:plany_app/screens/contacts/contact.dart';
import 'package:plany_app/screens/stations/stations.dart';
import 'package:plany_app/screens/userterminals/userterminal.dart';

class MyDrawers extends StatefulWidget {
  @override
  _MyDrawersState createState() => _MyDrawersState();
}

class _MyDrawersState extends State<MyDrawers> {
  int _currentIndex = 0;
  List _screens = [Home(), MyWork(), Chat(), Menu()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await UserPreferences().initPreferences();
    Domain = UserPreferences().domain;
    AuthToken = UserPreferences().token;
    print(Domain);
    print(AuthToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 43,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('asset/profilepic.png'),
                        ),
                      ),
                      Column(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            UserPreferences().email,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 25,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: const BorderSide(width: 2),
                              ),
                              // ignore: prefer_const_constructors
                              onPressed: () {},
                              child: Text(
                                UserPreferences().name,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => UserTerminal()));
                  },
                  leading: Icon(Icons.person),
                  title: Text('Users & terminals'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Stations()));
                  },
                  leading: Icon(Icons.ev_station),
                  title: Text('Stations'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Contact()));
                  },
                  leading: Icon(Icons.contacts),
                  title: Text('Contacts'),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Setting(),
                          //     ));
                        },
                        leading: Icon(Icons.subscriptions),
                        title: Text('Subscriptions')),
                    ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Setting(),
                              ));
                        },
                        leading: Icon(Icons.settings),
                        title: Text('Settings'))
                  ],
                ))),
          ),
        ],

        // child: ListView(
        //   children: [
        //     DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Colors.black,
        //       ),
        //       child: Row(
        //         // ignore: prefer_const_literals_to_create_immutables
        //         children: [
        //           // ignore: prefer_const_constructors
        //           CircleAvatar(
        //             backgroundColor: Colors.white54,
        //             radius: 43,
        //             // ignore: prefer_const_constructors
        //             child: CircleAvatar(
        //               radius: 40,
        //               backgroundImage: AssetImage('asset/profilepic.png'),
        //             ),
        //           ),
        //           // ignore: prefer_const_constructors
        //           SizedBox(
        //             width: 1,
        //           ),
        //
        //           Column(
        //             // mainAxisSize: MainAxisSize.max,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             // ignore: prefer_const_literals_to_create_immutables
        //             children: [
        //               Text(
        //                 UserPreferences().email,
        //                 style: TextStyle(color: Colors.white),
        //               ),
        //               const SizedBox(
        //                 height: 8,
        //               ),
        //               SizedBox(
        //                 height: 25,
        //                 child: OutlinedButton(
        //                   style: OutlinedButton.styleFrom(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(15.0),
        //                     ),
        //                     side: const BorderSide(width: 2),
        //                   ),
        //                   // ignore: prefer_const_constructors
        //                   onPressed: () {},
        //                   child: Text(
        //                     UserPreferences().name,
        //                   ),
        //                 ),
        //               )
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //           borderRadius: new BorderRadius.only(
        //         topLeft: const Radius.circular(40.0),
        //         topRight: const Radius.circular(40.0),
        //       )),
        //       child: Column(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(left: 14, top: 6),
        //             child: ListTile(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (builder) => UserTerminal()));
        //               },
        //               leading: Icon(Icons.person),
        //               title: Text('Users & terminals'),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 14),
        //             child: ListTile(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (builder) => Stations()));
        //               },
        //               leading: Icon(Icons.ev_station),
        //               title: Text('Stations'),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 14),
        //             child: ListTile(
        //               onTap: () {
        //                 Navigator.push(context,
        //                     MaterialPageRoute(builder: (builder) => Contact()));
        //               },
        //               leading: Icon(Icons.contacts),
        //               title: Text('Contacts'),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Divider(height: 0.2, color: Colors.black),
        //     Container(
        //       margin: EdgeInsets.only(left: 14),
        //       child: ListTile(
        //         leading: Icon(Icons.subscriptions),
        //         title: Text('Subscriptions'),
        //       ),
        //     ),

        //     Container(
        //       child: Align(
        //           alignment: FractionalOffset.bottomCenter,
        //           child: Container(
        //               child: Column(
        //             children: <Widget>[
        //               Divider(),
        //               ListTile(
        //                   leading: Icon(Icons.settings),
        //                   title: Text('Settings')),
        //               ListTile(
        //                   leading: Icon(Icons.help),
        //                   title: Text('Help and Feedback'))
        //             ],
        //           ))),
        //     ),
        //   ],
        // ),
        // ),
      )),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "MyWork",
            icon: Icon(Icons.work),
          ),
          BottomNavigationBarItem(
            label: "Chat",
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
