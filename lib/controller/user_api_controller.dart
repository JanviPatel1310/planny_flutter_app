import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:plany_app/models/user.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:plany_app/screens/authentication/register.dart';
import 'package:plany_app/screens/widgets/drawer.dart';
import 'package:plany_app/utils/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class UserApiController with Helper {
  Future<UserModel> register(BuildContext context,
      {String domain,
      String userName,
      //  String name,
      String password}) async {
    if (mainacces.connectionStatus == ConnectivityResult.none) {
      final snackBar = SnackBar(
          content: Text('Please make you have stable internet connection'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(mainacces.connectionStatus);
      return null;
    }
    // var url = Uri.parse("http://10.10.218.216:8000/api/register");
    var url = Uri.parse("https://api.plany.ai/api/register");

    var response = await http.post(url, body: {
      'domain': domain,
      'email': userName,
      'password': password,
      // 'name': name,
    });
    print(response.statusCode);

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 200) {
      UserPreferences().save(UserModel.fromJson(jsonResponse));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      print("prefs");
      print(prefs);
      Fluttertoast.showToast(
          msg: 'Login to continue',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyApp()),
          (Route<dynamic> route) => false);
      // UserPreferences().setDomain(domain: domain);
      // return UserModel.fromJson(jsonResponse);
    } else if (jsonResponse['status'] == 400) {
      Helper.showSnackBar(context, 'The domain has already been taken.',
          error: true);
    } else {
      Helper.showSnackBar(context, jsonDecode(response.body)['title'],
          error: true);
      return null;
    }
  }

  Future<UserModel> login(
    BuildContext context, {
    String domain,
    String password,
    String userName,
  }) async {
    if (mainacces.connectionStatus == ConnectivityResult.none) {
      final snackBar = SnackBar(
          content: Text('Please make you have stable internet connection'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(mainacces.connectionStatus);
      return null;
    }
    var url = Uri.parse("https://api.plany.ai/api/login");

    var response = await http.post(
      url,
      body: {'domain': domain, 'username': userName, 'password': password},
    );
    print(response.statusCode);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"] == 200) {
      UserPreferences().save(UserModel.fromJson(jsonResponse));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyDrawers()),
          (Route<dynamic> route) => false);

      UserPreferences().setDomain(domain: domain);

      return UserModel.fromJson(jsonResponse);
    } else {
      Helper.showSnackBar(context, jsonDecode(response.body)['title'],
          error: true);
      return null;
    }

    // if(response.statusCode == 200){
    //   var jsonResponse  = jsonDecode(response.body);
    //   UserPreferences().save(UserModel.fromJson(jsonResponse));
    //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  Home()));
    //   UserPreferences().setDomain(domain: domain);
    //   return UserModel.fromJson(jsonResponse);
    // }else{
    //   print("Errorr....... ");
    //   Helper.showSnackBar(context, jsonDecode(response.body)['title'], error: true);
    //
    //
    //   return null;
    // }
  }

  Future<UserModel> changePassword(BuildContext context,
      {String old_pass,
      String new_pass,
      String confirm_pass,
      String domain,
      String authToken,
      String id}) async {
    var url = Uri.parse("https://api.plany.ai/api/users/changePassword/$id");

    var response = await http.post(
      url,
      body: {
        'old_password': old_pass,
        'new_password': new_pass,
        'confirm_new_password': confirm_pass
      },
      headers: {
        'Accept': 'application/json',
        'domain': domain,
        'Authorization': authToken,
      },
    );
    print(response.statusCode);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"] == 200) {
      Fluttertoast.showToast(
          msg: "Password Changed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    } else if (jsonResponse["status"] == 310) {
      Fluttertoast.showToast(
          msg: "Invalid old password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<bool> deleteAccount(BuildContext context,
      {int idAccount, String domain}) async {
    if (mainacces.connectionStatus == ConnectivityResult.none) {
      final snackBar = SnackBar(
          content: Text('Please make you have stable internet connection'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(mainacces.connectionStatus);
      return false;
    }

    var url = Uri.parse("https://api.plany.ai/api/delete_account");
    // var url = Uri.parse("http://10.10.218.216:8000/api/delete_account");
    var response = await http.post(
      url,
      body: {
        'domain': domain,
        'id': idAccount.toString(),
      },
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"] == 200) {
      Helper.showSnackBar(context, jsonDecode(response.body)['title'],
          error: true);
      UserPreferences().deleteAccount();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Register(),
          ));
      return true;
    } else {
      Helper.showSnackBar(context, jsonDecode(response.body)['title'],
          error: true);
      return false;
    }
  }
}
