import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:plany_app/screens/task/task.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
        // centerTitle: true,
        title: ListTile(
          title: Center(
            child: Text(
              'Orders',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 12,
              ),
            ),
          ),
          subtitle: Center(
            child: Text('WO4562'),
          ),
        ),

        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(
                'Delete',
                style: TextStyle(color: Colors.blue),
              )),
              PopupMenuItem(
                  child: Text(
                'Archive All',
                style: TextStyle(color: Colors.blue),
              )),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz, color: Colors.blue),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          backgroundColor: Colors.blue,
          children: [
            SpeedDialChild(
                label: 'Task',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => PlanTask()));
                }),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' #WO4562',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' Papadopculos intamational SA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    // fontWeight:FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Container(
                      height: 30,
                      width: 7,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1.0),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ])),
                  title: Text('#242 Furniture TGSTB black Top ne Inipoc',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('QTY : 2',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('13/3/23',
                          style: TextStyle(color: Colors.grey, fontSize: 12))
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Container(
                      height: 30,
                      width: 7,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1.0),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ])),
                  title: Text('#242 Furniture TGSTB black Top ne Inipoc',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('QTY : 2',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('13/3/23',
                          style: TextStyle(color: Colors.grey, fontSize: 12))
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Container(
                      height: 30,
                      width: 7,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1.0),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ])),
                  title: Text('#242 Furniture TGSTB black Top ne Inipoc',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('QTY : 2',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('13/3/23',
                          style: TextStyle(color: Colors.grey, fontSize: 12))
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
