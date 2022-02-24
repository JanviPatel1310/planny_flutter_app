import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardList.dart';
import 'package:plany_app/modal/apiModel/responseModal/get_contact_response_model.dart';
import 'package:plany_app/modal/apiModel/responseModal/station_list_response.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskList.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskgroupList.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalDetails.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalList.dart';
import 'package:plany_app/modal/apiModel/responseModal/userList.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceList.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/modal/repo/get_contact_repo.dart';

class GetUserViewModel extends GetxController {
  ApiResponse apiResponse = ApiResponse.initial('Initial');
  ApiResponse apiResponseStation = ApiResponse.initial('Initial');
  ApiResponse apiResponseWorkspace = ApiResponse.initial('Initial');
  ApiResponse apiResponseWorkspaceEdit = ApiResponse.initial('Initial');
  ApiResponse apiResponseTerminalList = ApiResponse.initial('Initial');
  ApiResponse apiResponseTerminalDetails = ApiResponse.initial('Initial');
  ApiResponse boardList = ApiResponse.initial('Initial');
  ApiResponse taskList = ApiResponse.initial('Initial');
  ApiResponse usersList = ApiResponse.initial('Initial');
  ApiResponse taskgroupList = ApiResponse.initial('Initial');

  ///get user data...
  Future<void> getContact() async {
    apiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetContactResponseModel response =
          await GetContactRepo().getContactRepo();
      apiResponse = ApiResponse.complete(response);
      print("getUser.........>$response");
    } catch (e) {
      print("getUser.........>$e");
      apiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///station list
  Future<void> getStation() async {
    apiResponseStation = ApiResponse.loading('Loading');
    // update();
    try {
      StationListResponseModel response =
          await GetContactRepo().stationListRepo();
      apiResponseStation = ApiResponse.complete(response);
      print("getUser.........>$response");
    } catch (e) {
      print("getUser.........>$e");
      apiResponseStation = ApiResponse.error('error');
    }
    update();
  }

  ///users list
  Future<void> getUsers() async {
    usersList = ApiResponse.loading('Loading');
    // update();
    try {
      UsersListsResponseModel response = await GetContactRepo().usersListRepo();
      usersList = ApiResponse.complete(response);
      print("getUser.........>$response");
    } catch (e) {
      print("getUser.........>$e");
      usersList = ApiResponse.error('error');
    }
    update();
  }

  ///workspace list
  Future<void> getWorkspace() async {
    apiResponseWorkspace = ApiResponse.loading('Loading');
    update();
    try {
      WorkspaceModel response = await GetContactRepo().workspaceRepo();
      apiResponseWorkspace = ApiResponse.complete(response);
      print("getUser.........>$response");
    } catch (e) {
      print("getUser.........>$e");
      apiResponseWorkspace = ApiResponse.error('error');
    }
    update();
  }

  ///terminal list
  Future<void> getTerminalList() async {
    apiResponseTerminalList = ApiResponse.loading('Loading');
    // update();
    try {
      TerminalListResponseModel response =
          await GetContactRepo().terminalListRepo();
      apiResponseTerminalList = ApiResponse.complete(response);
      print("getTerminal result.........>$response");
    } catch (e) {
      print("getTerminal error.........>$e");
      apiResponseTerminalList = ApiResponse.error('error');
    }
    update();
  }

  ///board list
  Future<void> getBoardList() async {
    boardList = ApiResponse.loading('Loading');
    // update();
    try {
      BoardListResponseModel response = await GetContactRepo().boardListRepo();
      boardList = ApiResponse.complete(response);
      print("get board result.........>$response");
    } catch (e) {
      print("get board error.........>$e");
      boardList = ApiResponse.error('error');
    }
    update();
  }

  ///taskGroup list
  Future<void> gettaskGroupList() async {
    taskgroupList = ApiResponse.loading('Loading');
    // update();
    try {
      TaskgrouprListResponseModel response =
          await GetContactRepo().taskgroupListRepo();
      taskgroupList = ApiResponse.complete(response);
      print("get board result.........>$response");
    } catch (e) {
      print("get board error.........>$e");
      taskgroupList = ApiResponse.error('error');
    }
    update();
  }

  ///task list
  Future<void> getTaskList() async {
    taskList = ApiResponse.loading('Loading');
    update();
    try {
      TaskListsResponseModel response = await GetContactRepo().taskListRepo();

      taskList = ApiResponse.complete(response);
      print("get task result.........>$response");
    } catch (e) {
      print("get task error.........>$e");
      taskList = ApiResponse.error('error');
    }
    update();
  }

  ///terminal details
  Future<void> getTerminalDetails(String id) async {
    apiResponseTerminalDetails = ApiResponse.loading('Loading');
    // update();

    try {
      TerminalDetailsResponseModel response =
          await GetContactRepo().terminalDetailsRepo(id);
      apiResponseTerminalDetails = ApiResponse.complete(response);
      print("getTerminal result.........>$response");
    } catch (e) {
      print("getTerminal error.........>$e");
      apiResponseTerminalDetails = ApiResponse.error('error');
    }
    update();
  }
}
