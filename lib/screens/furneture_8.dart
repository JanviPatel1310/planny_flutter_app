import 'package:flutter/material.dart';
import 'package:plany_app/screens/assembly2.dart';
import 'package:plany_app/screens/authentication/setting.dart';

class Furniture extends StatefulWidget {
  @override
  _FurnitureState createState() => _FurnitureState();
}

class _FurnitureState extends State<Furniture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Furniture Assembly',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LibraryAssembly()),
                // );
              },
            ),
            // Container(  child: Text('back',style:TextStyle(fontSize:20,),),)
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Assembly2()),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Papapodolous International  SA',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '#W04562',
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '#L242 Furniture TG5TB black top',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Heres small text description for the card content nothing more ,nothing less',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: Colors.lightBlue,
                              onPressed: () {},
                              child: Text(
                                'QTY : 2',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'read more..',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black26),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Files Attached',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 12,
                                          color: Colors.grey,
                                          spreadRadius: 0.1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30.0,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 12,
                                          color: Colors.grey,
                                          spreadRadius: 0.1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30.0,
                                    child: Icon(Icons.camera),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.4,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.ac_unit_outlined,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Table wood with..',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.4,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.ac_unit_outlined,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Table wood with..',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.4,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.ac_unit_outlined,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Table wood with..',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'see more...',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black26),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chat',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '@Anjali bist',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'wrote',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '22/10/21',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '8:49 pm',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'This product has little changes on right side',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '@Faiq Ashar ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'edit',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '22/10/21',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '8:49 pm',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Change description from red color to black color ',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '@julia ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'edit',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '22/10/21',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '8:49 pm',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Add picture',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '@Roberto Juiliani',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'created',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '22/10/21',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '8:49 pm',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.66,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Post a comment'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.22,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
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
                        child: Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.blue,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
