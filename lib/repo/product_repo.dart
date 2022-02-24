import 'dart:convert';

import 'package:get/get.dart';
import 'package:plany_app/API/api_handler.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceList.dart';
import 'package:plany_app/models/contacts_model.dart';
import 'package:plany_app/models/editContact.dart';
import 'package:plany_app/models/stationsModel.dart';
import 'package:plany_app/models/taskModel.dart';
import 'package:plany_app/models/userTerminal.dart';
import 'package:plany_app/preferences/user_preferences.dart';

import '../Strings.dart';

class WorkspaceListRepo extends GetConnect {
  String Domain = '', AuthToken = '';
  getData() async {
    await UserPreferences().initPreferences();
    Domain = UserPreferences().domain;
    AuthToken = UserPreferences().token;
    print(Domain);
    print(AuthToken);
    WorkspaceListRepo.usersWorkspace(
        Base_URL + workspaceList, AuthToken, Domain);
  }

  static Future<UserModel> usersTerminal(
      String url, String token, String domain) async {
    var response = await API.apiHandler(
        url: Base_URL + userTerminal,
        apiType: ApiType.Get,
        AuthToken: token,
        Domain: domain);
    // print(json.decode(response.body));
    return userModelFromJson(response);
  }

  static Future<WorkspaceModel> usersWorkspace(
      String url, String token, String domain) async {
    var response = await API.apiHandler(
        url: Base_URL + workspaceList,
        apiType: ApiType.Get,
        AuthToken: token,
        Domain: domain);
    print('>>>>>>>>>>>>>>');
    // print(jsonDecode(response.body));
    return workspaceModelFromJson(response);
  }

  static Future<TaskModel> usersTask(
      String url, String token, String domain) async {
    var response = await API.apiHandler(
        url: Base_URL + userTask,
        apiType: ApiType.Get,
        AuthToken: token,
        Domain: domain);
    print('>>>>>>>>>>>>>>');
    print(jsonDecode(response.body));
    return taskModelFromJson(response);
  }

  static Future<StationsModel> stationsModel(
      String url, String token, String domain) async {
    var response = await API.apiHandler(
        url: Base_URL + stations,
        apiType: ApiType.Get,
        AuthToken: token,
        Domain: domain);
    print('??????');

    return stationsModelFromJson(response);
  }

  static Future<ContactsModel> contactsModel(
      String url, String token, String domain) async {
    var response = await API.apiHandler(
        url: Base_URL + contacts,
        apiType: ApiType.Get,
        AuthToken: token,
        Domain: domain);
    print('CONTACT');
    return contactsModelFromJson(response);
  }

  static Future<EditContactModel> editcontactsModel(
      {String url,
      String token,
      String domain,
      String name,
      String phone,
      String email,
      String id}) async {
    Map<String, dynamic> body = {'name': name, 'phone': phone, 'email': email};
    print('URL${Base_URL + edit_contacts + id}');
    print('BODY${body}');
    var response = await API.apiHandler(
        url: Base_URL + edit_contacts + id,
        apiType: ApiType.Post,
        AuthToken: token,
        Domain: domain,
        body: body);
    print('Respone  $response');
    EditContactModel editContactModel = EditContactModel.fromJson(response);
    return editContactModel;
  }
}
