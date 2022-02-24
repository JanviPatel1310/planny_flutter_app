import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:plany_app/screens/authentication/register.dart';
import 'package:plany_app/screens/widgets/drawer.dart';
import 'package:plany_app/viewModal/register_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().initPreferences();
  // var status = UserPreferences().isLoggedIn;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status1 = prefs.getBool('isLoggedIn');

  print(status1);
  runApp((GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: status1 == true ? MyDrawers() : MyApp())));
}

_MyAppState mainacces;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() {
    mainacces = _MyAppState();
    return mainacces;
  }
}

class _MyAppState extends State<MyApp> {
  bool login = false;
  // List data = [];
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;
  @override
  void initState() {
    super.initState();
    initConnectivity();

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
      if (connectionStatus == ConnectivityResult.none) {
        print(connectionStatus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Register(),
    );
  }

  ///
  EditContactViewModel editContactViewModel = Get.put(EditContactViewModel());
}
