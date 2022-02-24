import 'package:flutter/material.dart';

class TermianlDetailsUser extends StatefulWidget {
  @override
  _TermianlDetailsUserState createState() => _TermianlDetailsUserState();
}

class _TermianlDetailsUserState extends State<TermianlDetailsUser> {
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
                onPressed: () {},
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('asset/profilepic.png'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bending 3 Machine',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Station Depending Department',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Avatar',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Remove Avatar',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ]),
            ),
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
                  TextField(
                      decoration: InputDecoration(
                    label: Text('Friendly Name',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      // keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                    suffix: Icon(Icons.arrow_drop_down),
                    label: Text('stations',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Date Created',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      // keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                    label: Text('token',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      // keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                    suffix: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.lock_open),
                        SizedBox(width: 10),
                        Switch(
                            value: false,
                            onChanged: (bool state) {
                              print('locked');
                            }),
                        SizedBox(width: 10),
                        Icon(Icons.lock_rounded),
                      ],
                    ),
                    label: Text('Stations',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
