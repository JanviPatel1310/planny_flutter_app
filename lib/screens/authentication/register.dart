import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany_app/controller/user_api_controller.dart';
import 'package:plany_app/models/user.dart';
import 'package:plany_app/screens/authentication/register_domain.dart';
import 'package:plany_app/screens/start/start_over.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var baseurl = 'https://api.plany.ai/api/login';
  final myControllerDomain = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();
  GlobalKey<FormState> key1 = GlobalKey();
  GlobalKey<FormState> key2 = GlobalKey();
  int _tapIndex = 0;
  void login() async {
    UserModel user = await UserApiController().login(context,
        domain: myControllerDomain.text,
        password: myControllerPassword.text,
        userName: myControllerEmail.text);
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
    //     'username' : myControllerEmail.text,
    //     'password' : myControllerPassword.text
    //   }),
    // );
    //
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   if (jsonResponse['data'] == '0') {
    //     final snackBar = SnackBar(content: Text('Invalid domain name'));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   } else {
    //     final snackBar = SnackBar(content: Text('login success'));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     setState(() {
    //       mainacces!.data = jsonResponse['result'];
    //     });
    //     print(mainacces!.data);
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (builder) => Startover()));
    //   }
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   throw Exception('Failed to create album.');
    // }
  }

  void navigateToForm2() {
    // Navigator.pushNamed(context, "/login_screen");
    if (_tapIndex == 0) {
      setState(() {
        _tapIndex = 1;
      });
    } else if (_tapIndex == 1) {
      setState(() {
        _tapIndex = 0;
      });
    } else {
      setState(() {
        _tapIndex = 1;
      });
    }

    print(_tapIndex);
  }

  static validateDomain(String text) {
    if (text == null || text.isEmpty) {
      return 'domain required';
    } else {
      return null;
    }
  }

  static validateEmail(String text) {
    if (text == null || text.isEmpty) {
      return 'Email required';
    } else {
      return null;
    }
  }

  static validatePassword(String text) {
    if (text == null || text.isEmpty) {
      return 'Password required';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
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
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  _tapIndex == 0
                      ? 'What is your\n domain name'
                      : myControllerDomain.text,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              IndexedStack(
                index: _tapIndex,
                children: [
                  Visibility(
                    visible: _tapIndex == 0,
                    child: Column(
                      children: [
                        Form(
                          key: key1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: myControllerDomain,
                                  validator: (String value) =>
                                      validateDomain(value),
                                  decoration: InputDecoration(
                                    labelText: "domain",
                                    fillColor: Colors.white,
                                  ),
                                  //fillColor: Colors.green
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: TextButton(
                                  onPressed: () {
                                    if (key1.currentState.validate()) {
                                      Get.to(Startover());
                                      // navigateToForm2();
                                    }
                                  },
                                  child: Text('Next',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 140,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'You dont have\n an account?',
                                style: TextStyle(fontSize: 26),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => Regdomain()));
                              },
                              child: Text(
                                'Register',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _tapIndex == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                          key: key2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: myControllerEmail,
                                  validator: (String value) =>
                                      validateEmail(value),
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    fillColor: Colors.white,
                                  ),
                                  //fillColor: Colors.green
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: myControllerPassword,
                                  validator: (String value) =>
                                      validatePassword(value),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    fillColor: Colors.white,
                                  ),
                                  //fillColor: Colors.green
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: TextButton(
                            onPressed: () {
                              if (key2.currentState.validate()) {
                                login();
                              }
                            },
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: _tapIndex == 1,
            child: PositionedDirectional(
                top: 70,
                start: 20,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _tapIndex = 0;
                        print(_tapIndex);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ))),
          ),
        ],
      ),
    );
  }
}
