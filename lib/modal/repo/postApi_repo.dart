import 'dart:developer';

import 'package:plany_app/modal/apiModel/requestModal/addUser.dart';
import 'package:plany_app/modal/apiModel/requestModal/boardCreate.dart';
import 'package:plany_app/modal/apiModel/requestModal/boardEdit.dart';
import 'package:plany_app/modal/apiModel/requestModal/createStation.dart';
import 'package:plany_app/modal/apiModel/requestModal/createTaskGroup.dart';
import 'package:plany_app/modal/apiModel/requestModal/createTerminal.dart';
import 'package:plany_app/modal/apiModel/requestModal/createWorkspace.dart';
import 'package:plany_app/modal/apiModel/requestModal/edit_contact_reqModel.dart';
import 'package:plany_app/modal/apiModel/requestModal/inviteUser.dart';
import 'package:plany_app/modal/apiModel/requestModal/taskCreate.dart';
import 'package:plany_app/modal/apiModel/requestModal/taskEdit.dart';
import 'package:plany_app/modal/apiModel/requestModal/taskgroupEdit.dart';
import 'package:plany_app/modal/apiModel/requestModal/terminalEdit.dart';
import 'package:plany_app/modal/apiModel/requestModal/update_station.dart';
import 'package:plany_app/modal/apiModel/requestModal/userUpdate.dart';
import 'package:plany_app/modal/apiModel/requestModal/workspaceEdit.dart';
import 'package:plany_app/modal/apiModel/responseModal/addUser.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardCreate.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardEdit.dart';
import 'package:plany_app/modal/apiModel/responseModal/createStation.dart';
import 'package:plany_app/modal/apiModel/responseModal/createTaskgroup.dart';
import 'package:plany_app/modal/apiModel/responseModal/createTerminal.dart';
import 'package:plany_app/modal/apiModel/responseModal/edit_contact_response_model.dart';
import 'package:plany_app/modal/apiModel/responseModal/inviteUser.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskCreate.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskEdit.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskgroupDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/updateTaskgroup.dart';
import 'package:plany_app/modal/apiModel/responseModal/updateTerminal.dart';
import 'package:plany_app/modal/apiModel/responseModal/update_station_response_model.dart';
import 'package:plany_app/modal/apiModel/responseModal/userUpdate.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceEditResponse.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspacecreate.dart';
import 'package:plany_app/modal/services/api_service.dart';
import 'package:plany_app/modal/services/base_service.dart';

class EditContactRepo extends BaseService {
  Future<EditContactResponseModel> editContactRepo(
      EditContactRequestModel model, String id) async {
    Map<String, dynamic> body = model.toJson();
    String url = editContactURL + id;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    EditContactResponseModel registerResponse =
        EditContactResponseModel.fromJson(response);
    return registerResponse;
  }

  /// create station response
  Future<CreateStationResModel> createStationRepo(
      CreateStationRequestModel model) async {
    Map<String, dynamic> body = model.toJson();
    String url = createStationURL;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    CreateStationResModel registerResponse =
        CreateStationResModel.fromJson(response);
    return registerResponse;
  }

  ///update station
  Future<UpdateStationResponseModel> updateStationRepo(
      UpdateStationRequestModel model, String id) async {
    Map<String, dynamic> body = model.toJson();
    String url = updateStationURL + id;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    UpdateStationResponseModel registerResponse =
        UpdateStationResponseModel.fromJson(response);
    return registerResponse;
  }

  ///create workspace
  Future<WorkspaceCreateResponseModel> createWorkspaceRepo(
      CreateWorkspaceRequestModel model) async {
    Map<String, dynamic> body = model.toJson();
    String url = workspaceCreate;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    WorkspaceCreateResponseModel registerResponse =
        WorkspaceCreateResponseModel.fromJson(response);
    return registerResponse;
  }

  ///create task group
  Future<CreatTaskgrouprResponseModel> createTaskgroupRepo(
      CreateTaskGroupRequestModel model) async {
    Map<String, dynamic> body = model.toJson();
    String url = createTaskgroup;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    CreatTaskgrouprResponseModel registerResponse =
        CreatTaskgrouprResponseModel.fromJson(response);
    return registerResponse;
  }

  ///invite user
  Future<InviteUserResponseModel> inviteUsers(
      InviteUserRequestModel model) async {
    Map<String, dynamic> body = model.toJson();
    String url = inviteUser;
    print('Register Req :$body');
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("register res :${response}");
    InviteUserResponseModel registerResponse =
        InviteUserResponseModel.fromJson(response);
    return registerResponse;
  }

  ///workspace delete
  Future<WorkspaceDeleteResponseModel> workspaceDeleteRepo(String id) async {
    String url = workspaceDelete + id;

    print(url);
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: url);
    log("Delete res :${response}");
    WorkspaceDeleteResponseModel registerResponse =
        WorkspaceDeleteResponseModel.fromJson(response);
    return registerResponse;
  }

  ///board delete
  Future<BoardDeleteResponseModel> boardDeleteRepo(String id) async {
    String url = boardDelete + id;

    print(url);
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: url);
    log("Delete res :${response}");
    BoardDeleteResponseModel registerResponse =
        BoardDeleteResponseModel.fromJson(response);
    return registerResponse;
  }

  ///taskgroup delete
  Future<TaskgrouprDeleteResponseModel> taskgroupDeleteRepo(String id) async {
    String url = taskgroupDelete + id;

    print(url);
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: url);
    log("Delete res :${response}");
    TaskgrouprDeleteResponseModel registerResponse =
        TaskgrouprDeleteResponseModel.fromJson(response);
    return registerResponse;
  }

  ///terminal delete
  Future<TerminalDeleteResponseModel> terminalDeleteRepo(String id) async {
    String url = terminalDelete + id;

    print(url);
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: url);
    log("Delete res :${response}");
    TerminalDeleteResponseModel registerResponse =
        TerminalDeleteResponseModel.fromJson(response);
    return registerResponse;
  }

  /// task delete
  Future<TaskDeleteResponseModel> taskDeleteRepo(String id) async {
    String url = taskDelete + id;

    print(url);
    var response =
        await ApiService().getResponse(apiType: APIType.aPost, url: url);
    log("Delete res :${response}");
    TaskDeleteResponseModel registerResponse =
        TaskDeleteResponseModel.fromJson(response);
    return registerResponse;
  }

  ///workspace edit
  Future<WorkspaceEditResponseModel> workspaceEditRepo(
      UpdateWorkspaceRequestModel model, String id) async {
    String url = workspaceEdit + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Delete res :${response}");
    WorkspaceEditResponseModel registerResponse =
        WorkspaceEditResponseModel.fromJson(response);
    return registerResponse;
  }

  ///board edit
  Future<BoardEditResponseModel> boardEditRepo(
      UpdateBoardRequestModel model, String id) async {
    String url = boardEdit + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Board res :${response}");
    BoardEditResponseModel registerResponse =
        BoardEditResponseModel.fromJson(response);
    return registerResponse;
  }

  ///taskgroup edit
  Future<UpdateTaskgrouprResponseModel> taskgroupEditRepo(
      UpdateTaskGroupRequestModel model, String id) async {
    String url = taskgroupUpdate + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Taskgroup res :${response}");
    UpdateTaskgrouprResponseModel registerResponse =
        UpdateTaskgrouprResponseModel.fromJson(response);
    return registerResponse;
  }

  ///user edit
  Future<UserUpdateResponseModel> userEditRepo(
      UserUpdateRequestModel model, String id) async {
    String url = userEdit + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("User res :${response}");
    UserUpdateResponseModel registerResponse =
        UserUpdateResponseModel.fromJson(response);
    return registerResponse;
  }

  /// terminal edit
  Future<UpdateTerminalResponseModel> terminalEditRepo(
      UpdateTerminalRequestModel model, String id) async {
    String url = terminalEdit + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("terminal  res :${response}");
    UpdateTerminalResponseModel registerResponse =
        UpdateTerminalResponseModel.fromJson(response);
    return registerResponse;
  }

  ///task create
  Future<TaskCreateResponseModel> taskCreateRepo(
      TaskCreateRequestModel model) async {
    String url = taskCreate;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Delete res :${response}");
    TaskCreateResponseModel registerResponse =
        TaskCreateResponseModel.fromJson(response);
    return registerResponse;
  }

  ///task edit
  Future<TaskEditResponseModel> taskEditRepo(
      TaskEditRequestModel model, String id) async {
    String url = taskEdit + id;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Delete res :${response}");
    TaskEditResponseModel registerResponse =
        TaskEditResponseModel.fromJson(response);
    return registerResponse;
  }

  ///add user
  Future<AddUserResponseModel> addUserRepo(AddUserRequestModel model) async {
    String url = addUser;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Delete res :${response}");
    AddUserResponseModel registerResponse =
        AddUserResponseModel.fromJson(response);
    return registerResponse;
  }

  ///board create
  Future<BoardCreateResponseModel> boardCreateRepo(
      BoardCreateRequestModel model) async {
    String url = boardCreate;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Board res :${response}");
    BoardCreateResponseModel registerResponse =
        BoardCreateResponseModel.fromJson(response);
    return registerResponse;
  }

  ///create terminal
  Future<CreateTerminalResponseModel> terminalCreateRepo(
      CreateTerminalRequestModel model) async {
    String url = terminalCreate;
    Map<String, dynamic> body = model.toJson();
    print(url);
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: url, body: body);
    log("Delete res :${response}");
    CreateTerminalResponseModel registerResponse =
        CreateTerminalResponseModel.fromJson(response);
    return registerResponse;
  }
}
