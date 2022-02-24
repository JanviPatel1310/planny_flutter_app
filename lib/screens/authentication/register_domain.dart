// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:plany_app/controller/user_api_controller.dart';
import 'package:plany_app/main.dart';
import 'package:plany_app/models/user.dart';
import 'package:plany_app/screens/cancel_request.dart';
import 'package:plany_app/screens/start/start_over.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class Regdomain extends StatefulWidget {
  const Regdomain({Key key}) : super(key: key);

  @override
  _RegdomainState createState() => _RegdomainState();
}

class _RegdomainState extends State<Regdomain> {
  final myControllerDomain = TextEditingController();
  final myControllerName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  var baseurl = 'https://api.plany.ai/api/register';
  GoogleSignInAccount currentUser;
  GlobalKey<FormState> key = GlobalKey();
  String contactText = '';

  static validateDomain(String text) {
    if (text == null || text.isEmpty) {
      return 'Domain required';
    } else if (text.length < 3) {
      {
        return 'The domain must be at least 3 characters.';
      }
    }
    return null;
  }

  static validateEmail(String text) {
    if (text == null || text.isEmpty) {
      return 'Email required';
    } else {
      return null;
    }
  }

  // static  validateName(String? text) {
  //   if (text == null || text.isEmpty) {
  //     return 'Name required';
  //   } else {
  //     return null;
  //   }
  // }
  static validatePassword(String text) {
    if (text == null || text.isEmpty) {
      return 'Password required';
    } else {
      return null;
    }
  }

  void register() async {
    UserModel user = await UserApiController().register(context,
        domain: myControllerDomain.text,
        userName: myControllerEmail.text,
        // name: myControllerName.text,
        password: myControllerPassword.text);

    // if (mainacces!.connectionStatus == ConnectivityResult.none) {
    //   final snackBar = SnackBar(
    //       content: Text('Please make you have stable internet connection'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   print(mainacces!.connectionStatus);
    //   return null;
    // }
    // final response = await http.post(
    //   Uri.parse(baseurl),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'domain': myControllerDomain.text,
    //     'email': myControllerEmail.text,
    //     'password': myControllerPassword.text,
    //     'name': myControllerName.text,
    //   }),
    // );
    //
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   final snackBar = SnackBar(content: Text('${jsonResponse['data']}'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   // if (jsonResponse['result'] == '0') {
    //   //   final snackBar = SnackBar(content: Text('Registered'));
    //   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   //   Navigator.push(
    //   //       context, MaterialPageRoute(builder: (builder) => Startover()));
    //   // } else {
    //   //   final snackBar = SnackBar(content: Text('${jsonResponse['data']}'));
    //   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   // }
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   throw Exception('Failed to create album.');
    // }
  }

  void registerwithgoogle(displayName, email, id) async {
    if (mainacces.connectionStatus == ConnectivityResult.none) {
      final snackBar = SnackBar(
          content: Text('Please make you have stable internet connection'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(mainacces.connectionStatus);
      return null;
    }
    final response = await http.post(
      Uri.parse(baseurl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'domain': displayName,
        'email': email,
        'google_id': id,
        'type': 'google'
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['result'] == '0') {
        print('one');
        // ignore: prefer_const_constructors
        final snackBar = SnackBar(content: Text('Registered'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => Startover()));
      } else {
        print('two');
        final snackBar = SnackBar(content: Text('${jsonResponse['result']}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future signin() async {}

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        currentUser = account;
      });
      if (currentUser != null) {
        _handleGetContact(currentUser);
      }
    });
    googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        contactText = "I see you know $namedContact!";
      } else {
        contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> handleSignIn() async {
    try {
      final user = await googleSignIn.signIn();
      registerwithgoogle(user.displayName, user.email, user.id);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();

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
                    MaterialPageRoute(builder: (context) => Cancelreq()),
                  );
                },
                child: Text(
                  'Start Over',
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
              style: TextStyle(color: Colors.black38),
            )),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              'Register domain',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            )),
          ),
          Form(
              key: key,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: myControllerDomain,
                      validator: (String value) => validateDomain(value),
                      decoration: InputDecoration(
                        labelText: "domain",
                        fillColor: Colors.white,
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text(
                      'Register method',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    )),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 20, right: 20),
                  //   child: TextFormField(
                  //     controller: myControllerName,
                  //     validator: (String? value) => validateName(value),
                  //
                  //     decoration: new InputDecoration(
                  //       labelText: "Name",
                  //       fillColor: Colors.white,
                  //       // border: new OutlineInputBorder(
                  //       //   borderRadius: new BorderRadius.circular(25.0),
                  //       //   borderSide: new BorderSide(
                  //       //   ),
                  //     ),
                  //     //fillColor: Colors.green
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: myControllerEmail,
                      validator: (String value) => validateEmail(value),

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
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: myControllerPassword,
                      validator: (String value) => validatePassword(value),

                      decoration: new InputDecoration(
                        labelText: "Choose a password",
                        fillColor: Colors.white,
                        // border: new OutlineInputBorder(
                        //   borderRadius: new BorderRadius.circular(25.0),
                        //   borderSide: new BorderSide(
                        //   ),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                  if (key.currentState.validate()) {
                    register();
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Or',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: SignInButton(
              Buttons.GoogleDark,
              onPressed: handleSignIn,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text.rich(TextSpan(
                text: 'By sign up your account you agree with plannys ',
                style: TextStyle(color: Colors.black),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Pivacy polricy',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  TextSpan(
                    text: ' and',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextSpan(
                    text: ' Term of use',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  )
                ])),
          ),
        ],
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String s) {}
}
