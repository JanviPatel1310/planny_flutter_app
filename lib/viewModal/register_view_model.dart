import 'package:get/get.dart';
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
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/modal/repo/postApi_repo.dart';

class EditContactViewModel extends GetxController {
  ApiResponse editContactApiResponse = ApiResponse.initial('Initial');
  ApiResponse createStationResponse = ApiResponse.initial('Initial');
  ApiResponse updateStationResponse = ApiResponse.initial('Initial');
  ApiResponse updateWorkspaceResponse = ApiResponse.initial('Initial');
  ApiResponse createWorkspaceResponse = ApiResponse.initial('Initial');
  ApiResponse deleteWorkspaceResponse = ApiResponse.initial('Initial');
  ApiResponse editWorkspaceResponse = ApiResponse.initial('Initial');
  ApiResponse taskCreateResponse = ApiResponse.initial('Initial');
  ApiResponse deleteTaskResponse = ApiResponse.initial('Initial');
  ApiResponse terminalCreateResponse = ApiResponse.initial('Initial');
  ApiResponse terminalDeleteResponse = ApiResponse.initial('Initial');
  ApiResponse terminalUpdateResponse = ApiResponse.initial('Initial');
  ApiResponse boardCraateResponse = ApiResponse.initial('Initial');
  ApiResponse editBoardResponse = ApiResponse.initial('Initial');
  ApiResponse deleteBoardResponse = ApiResponse.initial('Initial');
  ApiResponse editUserResponse = ApiResponse.initial('Initial');
  ApiResponse taskEditResponse = ApiResponse.initial('Initial');
  ApiResponse adduser = ApiResponse.initial('Initial');
  ApiResponse createtaskGroup = ApiResponse.initial('Initial');
  ApiResponse deletetaskGroup = ApiResponse.initial('Initial');
  ApiResponse updatetaskGroup = ApiResponse.initial('Initial');
  ApiResponse inviteUser = ApiResponse.initial('Initial');

  /// register...
  Future<void> editContact(EditContactRequestModel model, String id) async {
    editContactApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      EditContactResponseModel response =
          await EditContactRepo().editContactRepo(model, id);
      editContactApiResponse = ApiResponse.complete(response);
      print("editContactApiResponse RES:$response");
    } catch (e) {
      print('editContactApiResponse.....$e');
      editContactApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///create station
  Future<void> createStation(CreateStationRequestModel model) async {
    createStationResponse = ApiResponse.loading('Loading');
    update();
    try {
      CreateStationResModel response =
          await EditContactRepo().createStationRepo(model);
      createStationResponse = ApiResponse.complete(response);
      print("createStationResponse RES:$response");
    } catch (e) {
      print('createStationResponse.....$e');
      createStationResponse = ApiResponse.error('error');
    }
    update();
  }

  ///update station
  Future<void> updateStation(UpdateStationRequestModel model, String id) async {
    updateStationResponse = ApiResponse.loading('Loading');
    update();
    try {
      UpdateStationResponseModel response =
          await EditContactRepo().updateStationRepo(model, id);
      updateStationResponse = ApiResponse.complete(response);
      print("updateStationResponse RES:$response");
    } catch (e) {
      print('updateStationResponse.....$e');
      updateStationResponse = ApiResponse.error('error');
    }
    update();
  }

  ///create  workspace
  Future<void> createWorkspace(CreateWorkspaceRequestModel model) async {
    createWorkspaceResponse = ApiResponse.loading('Loading');
    update();
    try {
      WorkspaceCreateResponseModel response =
          await EditContactRepo().createWorkspaceRepo(model);
      createWorkspaceResponse = ApiResponse.complete(response);
      print("createStationResponse RES:$response");
    } catch (e) {
      print('createStationResponse.....$e');
      createWorkspaceResponse = ApiResponse.error('error');
    }
    update();
  }

  ///create  task group
  Future<void> createTaskGroup(CreateTaskGroupRequestModel model) async {
    createtaskGroup = ApiResponse.loading('Loading');
    update();
    try {
      CreatTaskgrouprResponseModel response =
          await EditContactRepo().createTaskgroupRepo(model);
      createtaskGroup = ApiResponse.complete(response);
      print("create task group Response RES:$response");
    } catch (e) {
      print('create task group Response.....$e');
      createtaskGroup = ApiResponse.error('error');
    }
    update();
  }

  ///invite user
  Future<void> inviteUsers(InviteUserRequestModel model) async {
    inviteUser = ApiResponse.loading('Loading');
    update();
    try {
      InviteUserResponseModel response =
          await EditContactRepo().inviteUsers(model);
      inviteUser = ApiResponse.complete(response);
      print("invite user Response RES:$response");
    } catch (e) {
      print('invite user group Response.....$e');
      inviteUser = ApiResponse.error('error');
    }
    update();
  }

  ///delete workspace
  Future<void> deleteWorkspace(String id) async {
    deleteWorkspaceResponse = ApiResponse.loading('Loading');
    update();
    try {
      WorkspaceDeleteResponseModel response =
          await EditContactRepo().workspaceDeleteRepo(id);
      deleteWorkspaceResponse = ApiResponse.complete(response);
      print("delete worspace Response RES:$response");
    } catch (e) {
      print('delete workspace Response.....$e');
      deleteWorkspaceResponse = ApiResponse.error('error');
    }
    update();
  }

  ///delete board
  Future<void> deleteBoard(String id) async {
    deleteWorkspaceResponse = ApiResponse.loading('Loading');
    update();
    try {
      BoardDeleteResponseModel response =
          await EditContactRepo().boardDeleteRepo(id);
      deleteWorkspaceResponse = ApiResponse.complete(response);
      print("delete worspace Response RES:$response");
    } catch (e) {
      print('delete workspace Response.....$e');
      deleteWorkspaceResponse = ApiResponse.error('error');
    }
    update();
  }

  ///delete taskgroup
  Future<void> deleteTaskGroup(String id) async {
    deletetaskGroup = ApiResponse.loading('Loading');
    update();
    try {
      TaskgrouprDeleteResponseModel response =
          await EditContactRepo().taskgroupDeleteRepo(id);
      deletetaskGroup = ApiResponse.complete(response);
      print("delete worspace Response RES:$response");
    } catch (e) {
      print('delete workspace Response.....$e');
      deletetaskGroup = ApiResponse.error('error');
    }
    update();
  }

  ///terminal list
  Future<void> deleteTerminal(String id) async {
    terminalDeleteResponse = ApiResponse.loading('Loading');
    update();
    try {
      TerminalDeleteResponseModel response =
          await EditContactRepo().terminalDeleteRepo(id);
      terminalDeleteResponse = ApiResponse.complete(response);
      print("delete terminal Response RES:$response");
    } catch (e) {
      print('delete terminal Response.....$e');
      terminalDeleteResponse = ApiResponse.error('error');
    }
    update();
  }

  ///delete task
  Future<void> deleteTask(String id) async {
    deleteTaskResponse = ApiResponse.loading('Loading');
    update();
    try {
      TaskDeleteResponseModel response =
          await EditContactRepo().taskDeleteRepo(id);
      deleteTaskResponse = ApiResponse.complete(response);
      print("delete task Response RES:$response");
    } catch (e) {
      print('delete task Response.....$e');
      deleteTaskResponse = ApiResponse.error('error');
    }
    update();
  }

  ///edit workspace
  Future<void> editWorkspace(
      UpdateWorkspaceRequestModel model, String id) async {
    editWorkspaceResponse = ApiResponse.loading('Loading');
    update();
    try {
      WorkspaceEditResponseModel response =
          await EditContactRepo().workspaceEditRepo(model, id);
      editWorkspaceResponse = ApiResponse.complete(response);
      print("Edit worspace Response RES:$response");
    } catch (e) {
      print('Edit workspace Response.....$e');
      editWorkspaceResponse = ApiResponse.error('error');
    }
    update();
  }

  ///edit board
  Future<void> editBoard(UpdateBoardRequestModel model, String id) async {
    editBoardResponse = ApiResponse.loading('Loading');
    update();
    try {
      BoardEditResponseModel response =
          await EditContactRepo().boardEditRepo(model, id);
      editBoardResponse = ApiResponse.complete(response);
      print("Edit user Response RES:$response");
    } catch (e) {
      print('Edit user Response.....$e');
      editBoardResponse = ApiResponse.error('error');
    }
    update();
  }

  ///edit taskgroup
  Future<void> editTaskGroup(
      UpdateTaskGroupRequestModel model, String id) async {
    updatetaskGroup = ApiResponse.loading('Loading');
    update();
    try {
      UpdateTaskgrouprResponseModel response =
          await EditContactRepo().taskgroupEditRepo(model, id);
      updatetaskGroup = ApiResponse.complete(response);
      print("update task group Response:$response");
    } catch (e) {
      print('update task group Response.....$e');
      updatetaskGroup = ApiResponse.error('error');
    }
    update();
  }

  ///edit user
  Future<void> editUser(UserUpdateRequestModel model, String id) async {
    editUserResponse = ApiResponse.loading('Loading');
    update();
    try {
      UserUpdateResponseModel response =
          await EditContactRepo().userEditRepo(model, id);
      editUserResponse = ApiResponse.complete(response);
      print("Edit board Response RES:$response");
    } catch (e) {
      print('Edit board Response.....$e');
      editUserResponse = ApiResponse.error('error');
    }
    update();
  }

  ///edit terminal
  Future<void> editTerminal(UpdateTerminalRequestModel model, String id) async {
    terminalUpdateResponse = ApiResponse.loading('Loading');
    update();
    try {
      UpdateTerminalResponseModel response =
          await EditContactRepo().terminalEditRepo(model, id);
      terminalUpdateResponse = ApiResponse.complete(response);
      print("Edit terminal Response RES:$response");
    } catch (e) {
      print('Edit terminal Response.....$e');
      terminalUpdateResponse = ApiResponse.error('error');
    }
    update();
  }

  ///task create
  Future<void> createTask(TaskCreateRequestModel model) async {
    taskCreateResponse = ApiResponse.loading('Loading');
    // update();
    try {
      TaskCreateResponseModel response =
          await EditContactRepo().taskCreateRepo(model);
      taskCreateResponse = ApiResponse.complete(response);
      print("taskCreateResponse RES:$response");
    } catch (e) {
      print('taskCreateResponse.....$e');
      taskCreateResponse = ApiResponse.error('error');
    }
    update();
  }

  ///task edit
  Future<void> editTask(TaskEditRequestModel model, String id) async {
    taskEditResponse = ApiResponse.loading('Loading');
    // update();
    try {
      TaskEditResponseModel response =
          await EditContactRepo().taskEditRepo(model, id);
      taskEditResponse = ApiResponse.complete(response);
      print("taskCreateResponse RES:$response");
    } catch (e) {
      print('taskCreateResponse.....$e');
      taskEditResponse = ApiResponse.error('error');
    }
    update();
  }

  ///add User
  Future<void> addUser(AddUserRequestModel model) async {
    adduser = ApiResponse.loading('Loading');
    // update();
    try {
      AddUserResponseModel response =
          await EditContactRepo().addUserRepo(model);
      adduser = ApiResponse.complete(response);
      print("taskCreateResponse RES:$response");
    } catch (e) {
      print('taskCreateResponse.....$e');
      adduser = ApiResponse.error('error');
    }
    update();
  }

  ///board create
  Future<void> createBoard(BoardCreateRequestModel model) async {
    boardCraateResponse = ApiResponse.loading('Loading');
    // update();
    try {
      BoardCreateResponseModel response =
          await EditContactRepo().boardCreateRepo(model);
      boardCraateResponse = ApiResponse.complete(response);
      print("board CreateResponse RES:$response");
    } catch (e) {
      print('board CreateResponse.....$e');
      boardCraateResponse = ApiResponse.error('error');
    }
    update();
  }

  ///terminal create
  Future<void> createTerminal(CreateTerminalRequestModel model) async {
    terminalCreateResponse = ApiResponse.loading('Loading');
    // update();
    try {
      CreateTerminalResponseModel response =
          await EditContactRepo().terminalCreateRepo(model);
      terminalCreateResponse = ApiResponse.complete(response);
      print("taskCreateResponse RES:$response");
    } catch (e) {
      print('taskCreateResponse.....$e');
      terminalCreateResponse = ApiResponse.error('error');
    }
    update();
  }
}
