import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskList.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/preferences/user_preferences.dart';
import 'package:plany_app/screens/order/orderpage.dart';
import 'package:plany_app/screens/task/taskCreate.dart';
import 'package:plany_app/screens/task/taskEdit.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyWork extends StatefulWidget {
  const MyWork({Key key}) : super(key: key);

  @override
  _MyWorkState createState() => _MyWorkState();
}

class _MyWorkState extends State<MyWork> {
  GetUserViewModel getUserViewModel1 = Get.put(GetUserViewModel());
  String Domain = '', AuthToken = '';

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
    getUserViewModel1.getTaskList();
  }

  EditContactViewModel deleteTaskViewModel = Get.put(EditContactViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        // ignore: deprecated_member_use
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.blue,
        //     )),
        // FlatButton.icon(
        //     onPressed: () {
        //       Navigator.of(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios),
        //     label: Text('Back')),
        // centerTitle: true,
        title: Text(
          'Orders made to stock',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            // fontSize: 12,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.blue),
                )),
                PopupMenuItem(
                    child: Text(
                  'Archive All',
                  style: TextStyle(color: Colors.blue),
                )),
              ],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.more_horiz, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          backgroundColor: Colors.blue,
          children: [
            SpeedDialChild(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => OrderPage()));
              },
              label: 'Order',
            ),
            SpeedDialChild(
              label: 'Group',
            ),
            SpeedDialChild(
              onTap: () {
                Get.to(TaskCreate());
              },
              label: 'Task',
            )
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          // color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: const Text(
                        'Group by Order',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          // color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: const Text(
                        'Furniture D',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //   width: 2,
                        //   color: Colors.blue
                        // )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Petropoulos SA',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.blue, // Button color
                        child: InkWell(
                          splashColor: Colors.red, // Splash color
                          onTap: () {},
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.taskList.status == Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.taskList.status == Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }
                  TaskListsResponseModel responseModel =
                      controller.taskList.data;
                  return Column(
                      children: List.generate(responseModel.result.task.length,
                          (index) {
                    return Card(
                      // margin: EdgeInsets.symmetric(horizontal: 15),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          responseModel.result.task[index].title,
                          // style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Get.to(TaskEdit(), arguments: [
                            responseModel.result.task[index].title,
                            responseModel.result.task[index].quantity
                                .toString(),
                            responseModel.result.task[index].progress
                                .toString(),
                            responseModel.result.task[index].id.toString(),
                          ]);
                        },
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Progress ${responseModel.result.task[index].progress.toString()}',
                              // style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              ' Quantity ${responseModel.result.task[index].quantity.toString()}',
                              // style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),

                        // children: [
                        //   responseModel.result.workspace[index].board
                        //           .isNotEmpty
                        //       ? Container(
                        //           height: 200,
                        //           child: ListView.builder(
                        //               shrinkWrap: true,
                        //               itemCount: responseModel
                        //                   .result
                        //                   .workspace[index]
                        //                   .board
                        //                   .length,
                        //               itemBuilder:
                        //                   (BuildContext context,
                        //                       int index1) {
                        //                 String color = responseModel
                        //                     .result
                        //                     .workspace[index]
                        //                     .board[index1]
                        //                     .color
                        //                     .substring(1);
                        //                 print(color);
                        //                 String col = ("0xFF" + color);
                        //                 Color myColor =
                        //                     Color(int.parse(col));
                        //
                        //                 return ListTile(
                        //                   leading: Container(
                        //                     height: 60,
                        //                     width: 17,
                        //                     child: Column(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment
                        //                               .center,
                        //                       children: [
                        //                         Center(
                        //                           child: Container(
                        //                             // margin: EdgeInsets.all(10),
                        //                             height: 50,
                        //                             width: 10,
                        //                             decoration: BoxDecoration(
                        //                                 color: myColor,
                        //                                 borderRadius: BorderRadius
                        //                                     .all(Radius
                        //                                         .circular(
                        //                                             20))),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     decoration: BoxDecoration(
                        //                         boxShadow: [
                        //                           new BoxShadow(
                        //                             color: Colors.grey,
                        //                             blurRadius: 5.0,
                        //                           ),
                        //                         ],
                        //                         color: Colors.white,
                        //                         borderRadius:
                        //                             BorderRadius.all(
                        //                                 Radius.circular(
                        //                                     10))),
                        //                   ),
                        //                   title: Text(
                        //                       "${responseModel.result.workspace[index].board[index1].name}"),
                        //                 );
                        //               }),
                        //         )
                        //       : Container()
                        //
                        // ],
                      ),
                    );
                  }));
                  // return ListView.builder(
                  //   itemBuilder: (BuildContext context, int index) {
                  //     /* print('Workspace id');
                  //     print(responseModel.result.task[index].id);
                  //
                  //     String colorString = responseModel
                  //         .result.task[index].color
                  //         .toString();
                  //     print("Color UPDATED");
                  //     print('$colorString');
                  //
                  //     String valueString;
                  //     // =
                  //     //     colorString.split('(0xff')[1].split(')')[0];
                  //     String newValueString;
                  //     // = colorString.split('#')[1];
                  //     // int value = int.parse(valueString, radix: 16);
                  //     // Color otherColor = new Color(value);
                  //     // print('value string ${valueString}');
                  //     String colVal = responseModel
                  //             .result.workspace[index].color
                  //             .toString()
                  //             .startsWith('#')
                  //         ? newValueString = colorString.split('#')[1]
                  //         : valueString =
                  //             colorString.split('(0x')[1].split(')')[0];
                  //     int value = int.parse(colVal, radix: 16);
                  //     Color otherColor = new Color(value);
                  //     // print('OTHER COLOR  $otherColor');
                  //     // String color = '0xff' + newValueString;
                  //     // print('new COLOR  $newValueString');
                  //     // print('new COLOR  $valueString');*/
                  //
                  //     return Column(
                  //       children: [
                  //         Card(
                  //           // margin: EdgeInsets.symmetric(horizontal: 15),
                  //           elevation: 2,
                  //           child: ListTile(
                  //             // leading: Container(
                  //             //   height: 60,
                  //             //   width: 17,
                  //             //   child: Column(
                  //             //     mainAxisAlignment:
                  //             //         MainAxisAlignment.center,
                  //             //     children: [
                  //             //       Center(
                  //             //         child: Container(
                  //             //           // margin: EdgeInsets.all(10),
                  //             //           height: 50,
                  //             //           width: 10,
                  //             //           decoration: BoxDecoration(
                  //             //               color: otherColor,
                  //             //               borderRadius: BorderRadius.all(
                  //             //                   Radius.circular(20))),
                  //             //         ),
                  //             //       ),
                  //             //     ],
                  //             //   ),
                  //             //   decoration: BoxDecoration(
                  //             //       boxShadow: [
                  //             //         new BoxShadow(
                  //             //           color: Colors.grey,
                  //             //           blurRadius: 5.0,
                  //             //         ),
                  //             //       ],
                  //             //       color: Colors.white,
                  //             //       borderRadius: BorderRadius.all(
                  //             //           Radius.circular(10))),
                  //             // ),
                  //             /*  trailing: Wrap(
                  //               children: [
                  //                 TextButton(
                  //                     // color: Colors.blue,
                  //                     child: Text(
                  //                       'Create board',
                  //                       style:
                  //                           TextStyle(color: Colors.blue),
                  //                     ),
                  //                     onPressed: () {
                  //                       // Get.to(
                  //                       //   BoardCreate(),
                  //                       //   arguments: responseModel
                  //                       //       .result.workspace[index].id
                  //                       //       .toString(),
                  //                       // );
                  //                     }),
                  //                 IconButton(
                  //                     icon: const Icon(Icons.delete),
                  //                     tooltip: 'Increase volume by 10',
                  //                     onPressed: () async {
                  //                       WorkspaceDeleteResponseModel model =
                  //                           WorkspaceDeleteResponseModel();
                  //                       String id = responseModel
                  //                           .result.workspace[index].id
                  //                           .toString();
                  //                       print(id);
                  //                       await deleteWorkspaceViewModel
                  //                           .deleteWorkspace(id);
                  //                       if (deleteWorkspaceViewModel
                  //                               .deleteWorkspaceResponse
                  //                               .status ==
                  //                           Status.COMPLETE) {
                  //                         WorkspaceDeleteResponseModel
                  //                             resModel =
                  //                             deleteWorkspaceViewModel
                  //                                 .deleteWorkspaceResponse
                  //                                 .data;
                  //                         if (responseModel.title ==
                  //                             'success') {
                  //                           Fluttertoast.showToast(
                  //                               msg: responseModel.title
                  //                                   .toString(),
                  //                               toastLength:
                  //                                   Toast.LENGTH_SHORT,
                  //                               gravity:
                  //                                   ToastGravity.CENTER,
                  //                               timeInSecForIosWeb: 1,
                  //                               backgroundColor: Colors.red,
                  //                               textColor: Colors.white,
                  //                               fontSize: 16.0);
                  //                           Future.delayed(
                  //                               Duration(seconds: 2),
                  //                               () async {
                  //                             getUserViewModel
                  //                                 .getWorkspace();
                  //                             // Get.off(MyDrawers());
                  //                           });
                  //                         } else {
                  //                           Fluttertoast.showToast(
                  //                               msg: responseModel.title
                  //                                   .toString(),
                  //                               toastLength:
                  //                                   Toast.LENGTH_SHORT,
                  //                               gravity:
                  //                                   ToastGravity.CENTER,
                  //                               timeInSecForIosWeb: 1,
                  //                               backgroundColor: Colors.red,
                  //                               textColor: Colors.white,
                  //                               fontSize: 16.0);
                  //                         }
                  //                       } else {
                  //                         Fluttertoast.showToast(
                  //                             msg: "Please try again",
                  //                             toastLength:
                  //                                 Toast.LENGTH_SHORT,
                  //                             gravity: ToastGravity.CENTER,
                  //                             timeInSecForIosWeb: 1,
                  //                             backgroundColor: Colors.red,
                  //                             textColor: Colors.white,
                  //                             fontSize: 16.0);
                  //                       }
                  //                     }),
                  //               ],
                  //             ),
                  //             onTap: () {
                  //               Get.to(WorkspaceEdit(), arguments: [
                  //                 responseModel
                  //                     .result.workspace[index].name,
                  //                 responseModel.result.workspace[index].id
                  //                     .toString(),
                  //                 // otherColor
                  //               ]);
                  //             },*/
                  //             // title: Text(snapshot
                  //             //     .data!.result.workspace.length
                  //             //     .toString()),
                  //
                  //             title: Text(
                  //               responseModel.result.task[index].title,
                  //               // style: TextStyle(color: Colors.black),
                  //             ),
                  //             onTap: () {
                  //               Get.to(TaskEdit(), arguments: [
                  //                 responseModel.result.task[index].title,
                  //                 responseModel.result.task[index].quantity
                  //                     .toString(),
                  //                 responseModel.result.task[index].progress
                  //                     .toString(),
                  //                 responseModel.result.task[index].id
                  //                     .toString(),
                  //               ]);
                  //             },
                  //             subtitle: Column(
                  //               crossAxisAlignment:
                  //                   CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   ' Progress ${responseModel.result.task[index].progress.toString()}',
                  //                   // style: TextStyle(color: Colors.black),
                  //                 ),
                  //                 Text(
                  //                   ' Quantity ${responseModel.result.task[index].quantity.toString()}',
                  //                   // style: TextStyle(color: Colors.black),
                  //                 ),
                  //               ],
                  //             ),
                  //
                  //             // children: [
                  //             //   responseModel.result.workspace[index].board
                  //             //           .isNotEmpty
                  //             //       ? Container(
                  //             //           height: 200,
                  //             //           child: ListView.builder(
                  //             //               shrinkWrap: true,
                  //             //               itemCount: responseModel
                  //             //                   .result
                  //             //                   .workspace[index]
                  //             //                   .board
                  //             //                   .length,
                  //             //               itemBuilder:
                  //             //                   (BuildContext context,
                  //             //                       int index1) {
                  //             //                 String color = responseModel
                  //             //                     .result
                  //             //                     .workspace[index]
                  //             //                     .board[index1]
                  //             //                     .color
                  //             //                     .substring(1);
                  //             //                 print(color);
                  //             //                 String col = ("0xFF" + color);
                  //             //                 Color myColor =
                  //             //                     Color(int.parse(col));
                  //             //
                  //             //                 return ListTile(
                  //             //                   leading: Container(
                  //             //                     height: 60,
                  //             //                     width: 17,
                  //             //                     child: Column(
                  //             //                       mainAxisAlignment:
                  //             //                           MainAxisAlignment
                  //             //                               .center,
                  //             //                       children: [
                  //             //                         Center(
                  //             //                           child: Container(
                  //             //                             // margin: EdgeInsets.all(10),
                  //             //                             height: 50,
                  //             //                             width: 10,
                  //             //                             decoration: BoxDecoration(
                  //             //                                 color: myColor,
                  //             //                                 borderRadius: BorderRadius
                  //             //                                     .all(Radius
                  //             //                                         .circular(
                  //             //                                             20))),
                  //             //                           ),
                  //             //                         ),
                  //             //                       ],
                  //             //                     ),
                  //             //                     decoration: BoxDecoration(
                  //             //                         boxShadow: [
                  //             //                           new BoxShadow(
                  //             //                             color: Colors.grey,
                  //             //                             blurRadius: 5.0,
                  //             //                           ),
                  //             //                         ],
                  //             //                         color: Colors.white,
                  //             //                         borderRadius:
                  //             //                             BorderRadius.all(
                  //             //                                 Radius.circular(
                  //             //                                     10))),
                  //             //                   ),
                  //             //                   title: Text(
                  //             //                       "${responseModel.result.workspace[index].board[index1].name}"),
                  //             //                 );
                  //             //               }),
                  //             //         )
                  //             //       : Container()
                  //             //
                  //             // ],
                  //           ),
                  //         )
                  //       ],
                  //     );
                  //   },
                  //   itemCount: responseModel.result.task.length,
                  // );
                },
              ),
              /*  Container(
                  height: 500,
                  child: GetBuilder<GetUserViewModel>(
                    builder: (controller) {
                      if (controller.apiResponseTaskLists.status ==
                          Status.LOADING) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.apiResponseTaskLists.status ==
                          Status.ERROR) {
                        return Center(child: Text('Server Error'));
                      }
                      TaskListResponseModel responseModel =
                          controller.apiResponseTaskLists.data;
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          //
                          // String colorString = responseModel
                          //     .result.task[index].color
                          //     .toString();
                          // print("Color UPDATED");
                          // print('$colorString');
                          //
                          // String valueString;
                          // // =
                          // //     colorString.split('(0xff')[1].split(')')[0];
                          // String newValueString;
                          // // = colorString.split('#')[1];
                          // // int value = int.parse(valueString, radix: 16);
                          // // Color otherColor = new Color(value);
                          // // print('value string ${valueString}');
                          // String colVal = responseModel
                          //         .result.workspace[index].color
                          //         .toString()
                          //         .startsWith('#')
                          //     ? newValueString = colorString.split('#')[1]
                          //     : valueString =
                          //         colorString.split('(0x')[1].split(')')[0];
                          // int value = int.parse(colVal, radix: 16);
                          // Color otherColor = new Color(value);
                          // print('OTHER COLOR  $otherColor');
                          // String color = '0xff' + newValueString;
                          // print('new COLOR  $newValueString');
                          // print('new COLOR  $valueString');

                          return Column(
                            children: [
                              Card(
                                // margin: EdgeInsets.symmetric(horizontal: 15),
                                elevation: 2,
                                child: ListTile(
                                  // trailing: IconButton(
                                  //     icon: const Icon(Icons.delete),
                                  //     tooltip: 'Increase volume by 10',
                                  //     onPressed: () async {
                                  //       WorkspaceDeleteResponseModel model =
                                  //           WorkspaceDeleteResponseModel();
                                  //       String id = responseModel
                                  //           .result.workspace[index].id
                                  //           .toString();
                                  //       print(id);
                                  //       await deleteWorkspaceViewModel
                                  //           .deleteWorkspace(id);
                                  //       if (deleteWorkspaceViewModel
                                  //               .deleteWorkspaceResponse
                                  //               .status ==
                                  //           Status.COMPLETE) {
                                  //         WorkspaceDeleteResponseModel
                                  //             resModel =
                                  //             deleteWorkspaceViewModel
                                  //                 .deleteWorkspaceResponse.data;
                                  //         if (responseModel.title ==
                                  //             'success') {
                                  //           Fluttertoast.showToast(
                                  //               msg: responseModel.title
                                  //                   .toString(),
                                  //               toastLength: Toast.LENGTH_SHORT,
                                  //               gravity: ToastGravity.CENTER,
                                  //               timeInSecForIosWeb: 1,
                                  //               backgroundColor: Colors.red,
                                  //               textColor: Colors.white,
                                  //               fontSize: 16.0);
                                  //           Future.delayed(Duration(seconds: 2),
                                  //               () async {
                                  //             getUserViewModel.getWorkspace();
                                  //             // Get.off(MyDrawers());
                                  //           });
                                  //         } else {
                                  //           Fluttertoast.showToast(
                                  //               msg: responseModel.title
                                  //                   .toString(),
                                  //               toastLength: Toast.LENGTH_SHORT,
                                  //               gravity: ToastGravity.CENTER,
                                  //               timeInSecForIosWeb: 1,
                                  //               backgroundColor: Colors.red,
                                  //               textColor: Colors.white,
                                  //               fontSize: 16.0);
                                  //         }
                                  //       } else {
                                  //         Fluttertoast.showToast(
                                  //             msg: "Please try again",
                                  //             toastLength: Toast.LENGTH_SHORT,
                                  //             gravity: ToastGravity.CENTER,
                                  //             timeInSecForIosWeb: 1,
                                  //             backgroundColor: Colors.red,
                                  //             textColor: Colors.white,
                                  //             fontSize: 16.0);
                                  //       }
                                  //     }),
                                  onTap: () {
                                    // Get.to(WorkspaceEdit(), arguments: [
                                    //   responseModel
                                    //       .result.workspace[index].name,
                                    //   responseModel.result.workspace[index].id
                                    //       .toString(),
                                    //   // otherColor
                                    // ]);
                                  },
                                  // title: Text(snapshot
                                  //     .data!.result.workspace.length
                                  //     .toString()),
                                  title: Text(
                                    responseModel.result.task[index].title,
                                    // style: TextStyle(color: Colors.black),
                                  ),

                                  // children: [
                                  //   responseModel.result.workspace[index].board
                                  //           .isNotEmpty
                                  //       ? Container(
                                  //           height: 200,
                                  //           child: ListView.builder(
                                  //               shrinkWrap: true,
                                  //               itemCount: responseModel
                                  //                   .result
                                  //                   .workspace[index]
                                  //                   .board
                                  //                   .length,
                                  //               itemBuilder:
                                  //                   (BuildContext context,
                                  //                       int index1) {
                                  //                 String color = responseModel
                                  //                     .result
                                  //                     .workspace[index]
                                  //                     .board[index1]
                                  //                     .color
                                  //                     .substring(1);
                                  //                 print(color);
                                  //                 String col = ("0xFF" + color);
                                  //                 Color myColor =
                                  //                     Color(int.parse(col));
                                  //
                                  //                 return ListTile(
                                  //                   leading: Container(
                                  //                     height: 60,
                                  //                     width: 17,
                                  //                     child: Column(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .center,
                                  //                       children: [
                                  //                         Center(
                                  //                           child: Container(
                                  //                             // margin: EdgeInsets.all(10),
                                  //                             height: 50,
                                  //                             width: 10,
                                  //                             decoration: BoxDecoration(
                                  //                                 color: myColor,
                                  //                                 borderRadius: BorderRadius
                                  //                                     .all(Radius
                                  //                                         .circular(
                                  //                                             20))),
                                  //                           ),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                     decoration: BoxDecoration(
                                  //                         boxShadow: [
                                  //                           new BoxShadow(
                                  //                             color: Colors.grey,
                                  //                             blurRadius: 5.0,
                                  //                           ),
                                  //                         ],
                                  //                         color: Colors.white,
                                  //                         borderRadius:
                                  //                             BorderRadius.all(
                                  //                                 Radius.circular(
                                  //                                     10))),
                                  //                   ),
                                  //                   title: Text(
                                  //                       "${responseModel.result.workspace[index].board[index1].name}"),
                                  //                 );
                                  //               }),
                                  //         )
                                  //       : Container()
                                  //
                                  // ],
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: responseModel.result.task.length,
                      );
                    },
                  )),*/
            ],
          ),
        ),
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
}
