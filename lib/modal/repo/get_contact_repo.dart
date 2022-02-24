import 'dart:developer';

import 'package:plany_app/modal/apiModel/responseModal/boardList.dart';
import 'package:plany_app/modal/apiModel/responseModal/get_contact_response_model.dart';
import 'package:plany_app/modal/apiModel/responseModal/station_list_response.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskList.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskgroupList.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalDetails.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalList.dart';
import 'package:plany_app/modal/apiModel/responseModal/userList.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceList.dart';
import 'package:plany_app/modal/services/api_service.dart';
import 'package:plany_app/modal/services/base_service.dart';

class GetContactRepo extends BaseService {
  Future<dynamic> getContactRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: getContactURL);
    GetContactResponseModel getContactResponseModel =
        GetContactResponseModel.fromJson(response);
    log("register res :${response}");
    return getContactResponseModel;
  }

  ///station list
  Future<dynamic> stationListRepo() async {
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: stationList);
    StationListResponseModel getContactResponseModel =
        StationListResponseModel.fromJson(response);
    log("register res :${response}");
    return getContactResponseModel;
  }

  ///users list
  Future<dynamic> usersListRepo() async {
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: userList);
    UsersListsResponseModel getContactResponseModel =
        UsersListsResponseModel.fromJson(response);
    log("register res :${response}");
    return getContactResponseModel;
  }

  ///workspace list
  Future<dynamic> workspaceRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: workspaceList);
    WorkspaceModel getContactResponseModel = WorkspaceModel.fromJson(response);
    log("Workspace res :${response}");
    return getContactResponseModel;
  }

  ///terminal list
  Future<dynamic> terminalListRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: terminalList);
    TerminalListResponseModel getContactResponseModel =
        TerminalListResponseModel.fromJson(response);
    log("Task res :${response}");
    return getContactResponseModel;
  }

  ///board list
  Future<dynamic> boardListRepo() async {
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: boardList);
    BoardListResponseModel getContactResponseModel =
        BoardListResponseModel.fromJson(response);
    log("Task res :${response}");
    return getContactResponseModel;
  }

  ///taskgroup list
  Future<dynamic> taskgroupListRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: taskgroupList);
    TaskgrouprListResponseModel getContactResponseModel =
        TaskgrouprListResponseModel.fromJson(response);
    log("Task res :${response}");
    return getContactResponseModel;
  }

  ///task list
  Future<dynamic> taskListRepo() async {
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: taskList);
    TaskListsResponseModel taskListsResponseModel =
        TaskListsResponseModel.fromJson(response);
    log("Task res111 :${response}");
    return taskListsResponseModel;
  }

  ///terminal details
  Future<dynamic> terminalDetailsRepo(String id) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: terminalDetails + id);
    TerminalDetailsResponseModel getContactResponseModel =
        TerminalDetailsResponseModel.fromJson(response);
    log("Task res :${response}");
    return getContactResponseModel;
  }
}
