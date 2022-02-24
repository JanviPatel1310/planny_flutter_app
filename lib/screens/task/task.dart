import 'package:flutter/material.dart';

class PlanTask extends StatefulWidget {
  @override
  _PlanTaskState createState() => _PlanTaskState();
}

class _PlanTaskState extends State<PlanTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        // centerTitle: true,
        title: Text(
          'Tasks',
          style: TextStyle(
            color: Colors.black,
            // fontSize: 12,
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
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //     icon: Column(
      //       children: [
      //         Icon(Icons.trip_origin, color: Colors.red),
      //         Text(
      //           'Problems',
      //           style: TextStyle(color: Colors.red),
      //         )
      //       ],
      //     ),
      //     label: (''),
      //   ),
      //   BottomNavigationBarItem(
      //       icon: Column(
      //         children: [
      //           Icon(Icons.done, color: Colors.green),
      //           Text(
      //             'Done',
      //             style: TextStyle(color: Colors.green),
      //           )
      //         ],
      //       ),
      //       label: ''),
      // ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.1,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Papadopoulos International SA',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    '  #WO4562',
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
                    '  #L242 Furniture TG5TB black Top',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      // fontWeight:FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "  Here's a small text description for the\n   card content. Nothing more, nothing \n  less.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      // fontWeight:FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(5)),
                          width: 75,
                          height: 20,
                          child: Text(
                            'QTY : 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 30),
                        child: Column(
                          children: [
                            //  Text('modal for more details',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //       color: Colors.pink[300]
                            //     ),),

                            Text(
                              'Edit',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/1200px-Masala_Chai.JPG'),
                        ),
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
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(Icons.add),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    // width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.blue[50],
                        // borderRadius:BorderRadius.circular(20),
                        border: Border.all(
                          width: 5,
                          color: Colors.green,
                        )),
                    child: Text(
                      '33%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Files Attached',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset('asset/tables.png'),
                            ),
                            Text('Tables')
                          ],
                        ),
                      ])
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtasks',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(1)
                  },
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.attach_file)),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The text pf the firnss os b;iesx',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.attach_file)),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The text pf the firnss os b;iesx',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.attach_file)),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The text pf the firnss os b;iesx',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ]),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 410,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListView(children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ToggleButtons(
                      // isSelected: _isSelected,
                      // children:[
                      // Text('Chats',
                      // style: TextStyle(
                      //   color:Colors.grey,
                      // )),
                      //  Text('Logs',
                      // style: TextStyle(
                      //   color:Colors.grey,
                      // )),
                      // ],
                      // ),
                      Text('place toggle button here'),

                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'User',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: ' @Roberto Juliani',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: ' wrote',
                              style: TextStyle(color: Colors.grey))
                        ])),
                        subtitle:
                            Text('This product has small damage on write'),
                        trailing: Text('12/2/21 8:52',
                            style: TextStyle(color: Colors.grey))),
                    ListTile(
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'User',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: ' @Roberto Juliani',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: ' wrote',
                              style: TextStyle(color: Colors.grey))
                        ])),
                        subtitle:
                            Text('This product has small damage on write'),
                        trailing: Text('12/2/21 8:52',
                            style: TextStyle(color: Colors.grey))),
                    ListTile(
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'User',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: ' @Roberto Juliani',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: ' wrote',
                              style: TextStyle(color: Colors.grey))
                        ])),
                        subtitle:
                            Text('This product has small damage on write'),
                        trailing: Text('12/2/21 8:52',
                            style: TextStyle(color: Colors.grey))),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(' post a comment',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        // color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.blue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                        Icon(Icons.send, color: Colors.blue)
                      ],
                    ),
                  ),
                ])
              ]),
            ),
          ),
        ],
      )),
    );
  }
}
