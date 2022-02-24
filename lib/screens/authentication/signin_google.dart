import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:plany_app/screens/authentication/register.dart';

class Signin extends StatefulWidget {
  const Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    'start over',
                    style: TextStyle(fontSize: 20),
                  ),
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
              style: TextStyle(color: Colors.black38),
            )),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'domainName',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: new InputDecoration(
                labelText: "Email",
                fillColor: Colors.white,
                // border: new OutlineInputBorder(
                //   borderRadius: new BorderRadius.circular(25.0),
                //   borderSide: new BorderSide(
                //   ),
              ),
              //fillColor: Colors.green
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: new InputDecoration(
                labelText: "password",
                fillColor: Colors.white,
                // border: new OutlineInputBorder(
                //   borderRadius: new BorderRadius.circular(25.0),
                //   borderSide: new BorderSide(
                //   ),
              ),
              //fillColor: Colors.green
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  'or',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                _showButtonPressDialog(context, 'Google');
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
}
