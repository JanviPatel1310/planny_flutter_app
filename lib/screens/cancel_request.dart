import 'package:flutter/material.dart';
import 'package:plany_app/screens/authentication/signin_google.dart';

class Cancelreq extends StatefulWidget {
  @override
  _CancelreqState createState() => _CancelreqState();
}

class _CancelreqState extends State<Cancelreq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
                child: Text(
                  'cancel request',
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
            height: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  'Wait\nadministrator to\naccept it....',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
