import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/boardList.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskgroupDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskgroupList.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/workspaceList.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:plany_app/screens/Board/boardCreate.dart';
import 'package:plany_app/screens/Board/boardEdit.dart';
import 'package:plany_app/screens/task/createTaskgroup.dart';
import 'package:plany_app/screens/task/task.dart';
import 'package:plany_app/screens/task/taskgroupEdit.dart';
import 'package:plany_app/screens/widgets/mydrawer.dart';
import 'package:plany_app/screens/workspace/workspaceCreate.dart';
import 'package:plany_app/screens/workspace/workspaceEdit.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String Domain = '', AuthToken = '';

class _HomeState extends State<Home> {
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await UserPreferences().initPreferences();
    Domain = UserPreferences().domain;
    AuthToken = UserPreferences().token;
    print(Domain);
    print(AuthToken);
    getUserViewModel.getWorkspace();
    getUserViewModel1.getBoardList();
    getUserViewModel1.gettaskGroupList();
  }

  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  GetUserViewModel getUserViewModel1 = Get.put(GetUserViewModel());
  EditContactViewModel deleteWorkspaceViewModel =
      Get.put(EditContactViewModel());
  EditContactViewModel deleteBoardViewModel = Get.put(EditContactViewModel());
  EditContactViewModel deleteTaskGroupViewModel =
      Get.put(EditContactViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: ListTile(
          title: Center(
              child: Text(
            'Workspace & Boards',
            style: TextStyle(fontSize: 18),
          )),
          trailing: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanTask()),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  hintText: 'search workspace, boards, tasks, order and more',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Workspace',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.apiResponseWorkspace.status ==
                      Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.apiResponseWorkspace.status == Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }
                  WorkspaceModel responseModel =
                      controller.apiResponseWorkspace.data;
                  return Column(
                    children: List.generate(
                        responseModel.result.workspace.length, (index) {
                      String colorString = responseModel
                          .result.workspace[index].color
                          .toString();
                      print("Color UPDATED");
                      print('$colorString');
                      String valueString;
                      String newValueString;

                      String colVal = responseModel
                              .result.workspace[index].color
                              .toString()
                              .startsWith('#')
                          ? newValueString = colorString.split('#')[1]
                          : valueString =
                              colorString.split('(0x')[1].split(')')[0];
                      int value = int.parse(colVal, radix: 16);
                      Color otherColor = new Color(value);
                      return Column(
                        children: [
                          Card(
                            // margin: EdgeInsets.symmetric(horizontal: 15),
                            elevation: 2,
                            child: ListTile(
                              leading: Container(
                                height: 60,
                                width: 17,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        // margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: otherColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              trailing: Wrap(
                                children: [
                                  TextButton(
                                      // color: Colors.blue,
                                      child: Text(
                                        'Create board',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                          BoardCreate(),
                                          arguments: responseModel
                                              .result.workspace[index].id
                                              .toString(),
                                        );
                                      }),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      tooltip: 'Increase volume by 10',
                                      onPressed: () async {
                                        WorkspaceDeleteResponseModel model =
                                            WorkspaceDeleteResponseModel();
                                        String id = responseModel
                                            .result.workspace[index].id
                                            .toString();
                                        print(id);
                                        await deleteWorkspaceViewModel
                                            .deleteWorkspace(id);
                                        if (deleteWorkspaceViewModel
                                                .deleteWorkspaceResponse
                                                .status ==
                                            Status.COMPLETE) {
                                          WorkspaceDeleteResponseModel
                                              resModel =
                                              deleteWorkspaceViewModel
                                                  .deleteWorkspaceResponse.data;
                                          if (responseModel.title ==
                                              'success') {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            Future.delayed(Duration(seconds: 2),
                                                () async {
                                              getUserViewModel.getWorkspace();
                                              // Get.off(MyDrawers());
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Please try again",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }),
                                ],
                              ),
                              onTap: () {
                                Get.to(WorkspaceEdit(), arguments: [
                                  responseModel.result.workspace[index].name,
                                  responseModel.result.workspace[index].id
                                      .toString(),
                                  // otherColor
                                ]);
                              },
                              title: Text(
                                responseModel.result.workspace[index].name,
                                // style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Board',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.boardList.status == Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.boardList.status == Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }
                  BoardListResponseModel responseModel =
                      controller.boardList.data;
                  return Column(
                    children: List.generate(responseModel.result.board.length,
                        (index) {
                      String colorString =
                          responseModel.result.board[index].color.toString();
                      print("Color UPDATED");
                      print('$colorString');
                      String valueString;
                      String newValueString;
                      String colVal = responseModel.result.board[index].color
                              .toString()
                              .startsWith('#')
                          ? newValueString = colorString.split('#')[1]
                          : valueString =
                              colorString.split('(0x')[1].split(')')[0];
                      int value = int.parse(colVal, radix: 16);
                      Color otherColor = new Color(value);
                      return Column(
                        children: [
                          Card(
                            // margin: EdgeInsets.symmetric(horizontal: 15),
                            elevation: 2,
                            child: ListTile(
                              leading: Container(
                                height: 60,
                                width: 17,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        // margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: otherColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              trailing: Wrap(
                                children: [
                                  Column(
                                    children: [
                                      TextButton(
                                          // color: Colors.blue,
                                          child: Text(
                                            'Edit',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          onPressed: () {
                                            Get.to(BoardEdit(), arguments: [
                                              responseModel
                                                  .result.board[index].name,
                                              responseModel
                                                  .result.board[index].id
                                                  .toString(),
                                              // otherColor
                                            ]);
                                          }),
                                    ],
                                  ),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        BoardDeleteResponseModel model =
                                            BoardDeleteResponseModel();
                                        String id = responseModel
                                            .result.board[index].id
                                            .toString();
                                        print(id);
                                        await deleteBoardViewModel
                                            .deleteBoard(id);
                                        if (deleteBoardViewModel
                                                .deleteBoardResponse.status ==
                                            Status.COMPLETE) {
                                          BoardDeleteResponseModel resModel =
                                              deleteBoardViewModel
                                                  .deleteBoardResponse.data;
                                          if (responseModel.title ==
                                              'success') {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            Future.delayed(Duration(seconds: 2),
                                                () async {
                                              getUserViewModel
                                                  .gettaskGroupList();
                                              // Get.off(MyDrawers());
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Please try again",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }),
                                ],
                              ),
                              onTap: () {
                                _onBasicAlertPressed(
                                    context,
                                    responseModel.result.board[index].id
                                        .toString(),
                                    responseModel.result.board[index].name,
                                    responseModel
                                        .result.board[index].workspaceId
                                        .toString());
                              },
                              title: Text(
                                responseModel.result.board[index].name,
                                // style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Workspace id ${responseModel.result.board[index].workspace.id.toString()}',
                                    // style: TextStyle(color: Colors.black),
                                  ),
                                  TextButton(
                                      // color: Colors.blue,
                                      child: Text(
                                        'Create task group',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {
                                        print('BUTTON PRESSED');
                                        Get.to(
                                          CreateTaskGroup(),
                                          arguments: responseModel
                                              .result.board[index].id
                                              .toString(),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Task group',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.taskgroupList.status == Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.taskgroupList.status == Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }
                  TaskgrouprListResponseModel responseModel =
                      controller.taskgroupList.data;
                  return Column(
                    children: List.generate(
                        responseModel.result.taskGroups.length, (index) {
                      String colorString = responseModel
                          .result.taskGroups[index].color
                          .toString();
                      print("Color UPDATED");
                      print('$colorString');
                      String valueString;
                      String newValueString;
                      String colVal = responseModel
                              .result.taskGroups[index].color
                              .toString()
                              .startsWith('#')
                          ? newValueString = colorString.split('#')[1]
                          : valueString =
                              colorString.split('(0x')[1].split(')')[0];
                      int value = int.parse(colVal, radix: 16);
                      Color otherColor = new Color(value);
                      return Column(
                        children: [
                          Card(
                            // margin: EdgeInsets.symmetric(horizontal: 15),
                            elevation: 2,
                            child: ListTile(
                              leading: Container(
                                height: 60,
                                width: 17,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        // margin: EdgeInsets.all(10),
                                        height: 50,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: otherColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              trailing: Wrap(
                                children: [
                                  Column(
                                    children: [
                                      TextButton(
                                          // color: Colors.blue,
                                          child: Text(
                                            'Edit',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          onPressed: () {
                                            Get.to(TaskGroupEdit(), arguments: [
                                              responseModel.result
                                                  .taskGroups[index].name,
                                              responseModel
                                                  .result.taskGroups[index].id
                                                  .toString(),
                                              // otherColor
                                            ]);
                                          }),
                                    ],
                                  ),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        TaskgrouprDeleteResponseModel model =
                                            TaskgrouprDeleteResponseModel();
                                        String id = responseModel
                                            .result.taskGroups[index].id
                                            .toString();
                                        print(id);
                                        await deleteTaskGroupViewModel
                                            .deleteTaskGroup(id);
                                        if (deleteTaskGroupViewModel
                                                .deletetaskGroup.status ==
                                            Status.COMPLETE) {
                                          TaskgrouprDeleteResponseModel
                                              resModel =
                                              deleteTaskGroupViewModel
                                                  .deletetaskGroup.data;
                                          if (responseModel.title ==
                                              'success') {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            Future.delayed(Duration(seconds: 2),
                                                () async {
                                              getUserViewModel
                                                  .gettaskGroupList();
                                              // Get.off(MyDrawers());
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: responseModel.title
                                                    .toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Please try again",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }),
                                ],
                              ),
                              onTap: () {
                                _onBasicAlertPressed1(
                                    context,
                                    responseModel.result.taskGroups[index].id
                                        .toString(),
                                    responseModel
                                        .result.taskGroups[index].name);
                              },
                              title: Text(
                                responseModel.result.taskGroups[index].name,
                                // style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild(
            onTap: () {
              Get.to(WorkspaceCreate());
            },
            label: 'Workspace',
          ),
          SpeedDialChild(
            onTap: () {
              // Get.to(WorkspaceCreate());
            },
            label: 'Board',
          ),
        ],
        child: const Icon(Icons.add),
      ),
    );
  }

  _onBasicAlertPressed(context, String id, String name, String workspaceId) {
    Alert(
            context: context,
            title: 'Board ' + id,
            desc: 'Board name ${name}\nWorkspace Id${workspaceId}')
        .show();
  }

  _onBasicAlertPressed1(context, String id, String name) {
    Alert(
            context: context,
            title: 'Taskgroup id ' + id,
            desc: 'Taskgroup name ${name}')
        .show();
  }
}
