import 'package:flutter/material.dart';
import 'package:plany_app/screens/chatscreens/chatscreen.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.blue,
        //     )),
        centerTitle: true,
        title: Text(
          'Chat',
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0,
                  )),
              fillColor: Colors.grey[350],
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ChatScreen()));
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('asset/tables.png'),
                      ),
                      title: Text('Fawad Kaleem'),
                      subtitle: Text("I complete My task"),
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
