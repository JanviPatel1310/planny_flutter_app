import 'package:flutter/material.dart';
import 'package:plany_app/screens/widgets/bottomchat.dart';
import 'package:plany_app/screens/widgets/chatbubble.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomChatClass(),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Chat',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                trailing: CircleAvatar(
                    backgroundImage: AssetImage('asset/tables.png')),
                title: ChatBubble(
                  text: 'Hi,How are you, We can not meet long time ago',
                  isCurrentUser: true,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage('asset/tables.png')),
                title: ChatBubble(
                  text: 'Hi,How are you, We can not meet long time ago',
                  isCurrentUser: true,
                ),
              ),
            ),
          ],
        ));
  }
}
