import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:plany_app/modal/apiModel/requestModal/inviteUser.dart';
import 'package:plany_app/modal/apiModel/responseModal/inviteUser.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalList.dart';
import 'package:plany_app/modal/apiModel/responseModal/userList.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/screens/User/addUser.dart';
import 'package:plany_app/screens/userterminals/terminal_edit1.dart';
import 'package:plany_app/screens/userterminals/userterminaluserdetails.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserTerminal extends StatefulWidget {
  @override
  _UserTerminalState createState() => _UserTerminalState();
}

class _UserTerminalState extends State<UserTerminal> {
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  EditContactViewModel deleteTerminalViewModel =
      Get.put(EditContactViewModel());
  EditContactViewModel inviteUserViewModel = Get.put(EditContactViewModel());

  @override
  void initState() {
    getUserViewModel.getUsers();
    getUserViewModel.getTerminalList();
    getUserViewModel.getStation();
    super.initState();
  }

  List stationName = [];
  TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          backgroundColor: Colors.blue,
          children: [
            SpeedDialChild(
              onTap: () {
                Get.to(AddUser());
              },
              label: 'Add user',
            ),
            SpeedDialChild(
              onTap: () {
                _showMyDialog();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => OrderPage()));
              },
              label: 'InviteUser',
            ),
          ]),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        actions: [
          PopupMenuButton(
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
        ],
        centerTitle: true,
        title: Text(
          'Users & Terminal',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                // margin: EdgeInsets.only(top: 30, right: 15, left: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: 'Users & Terminals',
                    //  labelText: 'Enter the access code ',
                  ),
                ),
              ),
              Text(
                'Users',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.usersList.status == Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.usersList.status == Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }

                  UsersListsResponseModel responseModel =
                      controller.usersList.data;
                  print('Station RES -----$responseModel');
                  return Column(
                    children:
                        List.generate(responseModel.result.length, (index) {
                      return ListTile(
                        trailing: responseModel.result[index].name == null
                            ? SizedBox()
                            : IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  Get.to(EachUserDetails(), arguments: [
                                    responseModel.result[index].name,
                                    responseModel
                                        .result[index].registrationStatusId,
                                    responseModel.result[index].id.toString(),
                                    responseModel.result[index].email,
                                    responseModel.result[index].username,
                                  ]);
                                  // Get.to(TermianlCreate(),
                                  //     arguments: responseModel
                                  //         .result.stations[index].id
                                  //         .toString());
                                }),
                        title: responseModel.result[index].name == null
                            ? Container()
                            : Text(responseModel.result[index].name),
                        // subtitle: Text(responseModel.result[index].email),
                      );
                    }),
                  );
                },
              ),
              // Container(
              //   height: 200,
              //   child: FutureBuilder(
              //       future: WorkspaceListRepo.usersTerminal(
              //           Base_URL + userTerminal, AuthToken, Domain),
              //       builder: (BuildContext context,
              //           AsyncSnapshot<UserModel> snapshot) {
              //         if (snapshot.connectionState == ConnectionState.done) {
              //           if (snapshot.hasData) {
              //             return ListView.builder(
              //                 itemCount: snapshot.data.result.length,
              //                 itemBuilder: (BuildContext context, int index) {
              //                   return ListTile(
              //                       onTap: () {
              //                         Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                                 builder: (builder) =>
              //                                     EachUserDetails()));
              //                       },
              //                       trailing:
              //                           snapshot.data.result[index].name != null
              //                               ? Icon(Icons.arrow_forward_ios)
              //                               : SizedBox(),
              //                       title: snapshot.data.result[index].name !=
              //                               null
              //                           ? Text(snapshot.data.result[index].name)
              //                           : SizedBox());
              //                 });
              //           } else {
              //             return Center(
              //               child: Text('NO DATA FOUND'),
              //             );
              //           }
              //         }
              //         return Center(child: CircularProgressIndicator());
              //       }),
              // ),
              Text(
                'Terminals',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<GetUserViewModel>(
                builder: (controller) {
                  if (controller.apiResponseTerminalList.status ==
                      Status.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.apiResponseTerminalList.status ==
                      Status.ERROR) {
                    return Center(child: Text('Server Error'));
                  }

                  TerminalListResponseModel responseModel =
                      controller.apiResponseTerminalList.data;
                  print('Terminal RES -----$responseModel');
                  return Column(
                    children: List.generate(
                        responseModel.result.terminals.length, (index) {
                      String date = DateFormat('yyyy-MM-dd').format(
                          responseModel.result.terminals[index].createdAt);
                      return ListTile(
                        onTap: () {
                          _onBasicAlertPressed(
                              context,
                              responseModel.result.terminals[index].id
                                  .toString(),
                              responseModel.result.terminals[index].frientlyName
                                  .toString());
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Get.to(
                              TerminalEdit1(),
                              arguments: [
                                responseModel
                                    .result.terminals[index].frientlyName,
                                responseModel.result.terminals[index].stationId
                                    .toString(),
                                date,
                                responseModel.result.terminals[index].id
                                    .toString(),
                                responseModel
                                    .result.terminals[index].frientlyName
                              ],
                            );
                          },
                        ),
                        // trailing: Wrap(
                        //   children: [
                        //     TextButton(
                        //         // color: Colors.blue,
                        //         child: Text(
                        //           'Edit',
                        //           style: TextStyle(color: Colors.blue),
                        //         ),
                        //         onPressed: () {
                        //           Get.to(
                        //             TerminalEdit(),
                        //             arguments: [
                        //               responseModel
                        //                   .result.terminals[index].frientlyName,
                        //               responseModel
                        //                   .result.terminals[index].stationId
                        //                   .toString(),
                        //               date,
                        //               responseModel.result.terminals[index].id
                        //                   .toString(),
                        //               responseModel
                        //                   .result.terminals[index].frientlyName
                        //             ],
                        //           );
                        //         }),
                        //     IconButton(
                        //         icon: const Icon(Icons.delete),
                        //         onPressed: () async {
                        //           String id = responseModel
                        //               .result.terminals[index].id
                        //               .toString();
                        //           print(id);
                        //           await deleteTerminalViewModel
                        //               .deleteTerminal(id);
                        //           if (deleteTerminalViewModel
                        //                   .terminalDeleteResponse.status ==
                        //               Status.COMPLETE) {
                        //             TerminalDeleteResponseModel resModel =
                        //                 deleteTerminalViewModel
                        //                     .terminalDeleteResponse.data;
                        //             if (responseModel.title == 'success') {
                        //               Fluttertoast.showToast(
                        //                   msg: responseModel.title.toString(),
                        //                   toastLength: Toast.LENGTH_SHORT,
                        //                   gravity: ToastGravity.CENTER,
                        //                   timeInSecForIosWeb: 1,
                        //                   backgroundColor: Colors.red,
                        //                   textColor: Colors.white,
                        //                   fontSize: 16.0);
                        //               Future.delayed(Duration(seconds: 1),
                        //                   () async {
                        //                 getUserViewModel.getTerminalList();
                        //                 // Get.off(MyDrawers());
                        //               });
                        //             } else {
                        //               Fluttertoast.showToast(
                        //                   msg: responseModel.title.toString(),
                        //                   toastLength: Toast.LENGTH_SHORT,
                        //                   gravity: ToastGravity.CENTER,
                        //                   timeInSecForIosWeb: 1,
                        //                   backgroundColor: Colors.red,
                        //                   textColor: Colors.white,
                        //                   fontSize: 16.0);
                        //             }
                        //           } else {
                        //             Fluttertoast.showToast(
                        //                 msg: "Please try again",
                        //                 toastLength: Toast.LENGTH_SHORT,
                        //                 gravity: ToastGravity.CENTER,
                        //                 timeInSecForIosWeb: 1,
                        //                 backgroundColor: Colors.red,
                        //                 textColor: Colors.white,
                        //                 fontSize: 16.0);
                        //           }
                        //         }),
                        //   ],
                        // ),
                        title: Text(
                            responseModel.result.terminals[index].frientlyName),
                        // subtitle: Text(
                        //     responseModel.result.terminals[index].token),
                      );
                    }),
                    // ListView.builder(
                    //     itemCount: responseModel.result.terminals.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       String date = DateFormat('dd-MM-yyyy').format(
                    //           responseModel.result.terminals[index].createdAt);
                    //       return ListTile(
                    //         onTap: () {
                    //           _onBasicAlertPressed(
                    //               context,
                    //               responseModel.result.terminals[index].id
                    //                   .toString(),
                    //               responseModel
                    //                   .result.terminals[index].frientlyName
                    //                   .toString());
                    //         },
                    //         trailing: Wrap(
                    //           children: [
                    //             TextButton(
                    //                 // color: Colors.blue,
                    //                 child: Text(
                    //                   'Edit',
                    //                   style: TextStyle(color: Colors.blue),
                    //                 ),
                    //                 onPressed: () {
                    //                   Get.to(
                    //                     TerminalEdit(),
                    //                     arguments: [
                    //                       responseModel.result.terminals[index]
                    //                           .frientlyName,
                    //                       responseModel
                    //                           .result.terminals[index].stationId
                    //                           .toString(),
                    //                       date,
                    //                       responseModel
                    //                           .result.terminals[index].id
                    //                           .toString(),
                    //                       responseModel.result.terminals[index]
                    //                           .frientlyName
                    //                     ],
                    //                   );
                    //                 }),
                    //             IconButton(
                    //                 icon: const Icon(Icons.delete),
                    //                 onPressed: () async {
                    //                   String id = responseModel
                    //                       .result.terminals[index].id
                    //                       .toString();
                    //                   print(id);
                    //                   await deleteTerminalViewModel
                    //                       .deleteTerminal(id);
                    //                   if (deleteTerminalViewModel
                    //                           .terminalDeleteResponse.status ==
                    //                       Status.COMPLETE) {
                    //                     TerminalDeleteResponseModel resModel =
                    //                         deleteTerminalViewModel
                    //                             .terminalDeleteResponse.data;
                    //                     if (responseModel.title == 'success') {
                    //                       Fluttertoast.showToast(
                    //                           msg: responseModel.title
                    //                               .toString(),
                    //                           toastLength: Toast.LENGTH_SHORT,
                    //                           gravity: ToastGravity.CENTER,
                    //                           timeInSecForIosWeb: 1,
                    //                           backgroundColor: Colors.red,
                    //                           textColor: Colors.white,
                    //                           fontSize: 16.0);
                    //                       Future.delayed(Duration(seconds: 1),
                    //                           () async {
                    //                         getUserViewModel.getTerminalList();
                    //                         // Get.off(MyDrawers());
                    //                       });
                    //                     } else {
                    //                       Fluttertoast.showToast(
                    //                           msg: responseModel.title
                    //                               .toString(),
                    //                           toastLength: Toast.LENGTH_SHORT,
                    //                           gravity: ToastGravity.CENTER,
                    //                           timeInSecForIosWeb: 1,
                    //                           backgroundColor: Colors.red,
                    //                           textColor: Colors.white,
                    //                           fontSize: 16.0);
                    //                     }
                    //                   } else {
                    //                     Fluttertoast.showToast(
                    //                         msg: "Please try again",
                    //                         toastLength: Toast.LENGTH_SHORT,
                    //                         gravity: ToastGravity.CENTER,
                    //                         timeInSecForIosWeb: 1,
                    //                         backgroundColor: Colors.red,
                    //                         textColor: Colors.white,
                    //                         fontSize: 16.0);
                    //                   }
                    //                 }),
                    //           ],
                    //         ),
                    //         title: Text(responseModel
                    //             .result.terminals[index].frientlyName),
                    //         // subtitle: Text(
                    //         //     responseModel.result.terminals[index].token),
                    //       );
                    //     }),
                  );
                },
              ),
              // Container(
              //   child: FutureBuilder(builder: (BuildContext context,
              //       AsyncSnapshot<List<UserModel>> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       return ListView.builder(
              //           itemBuilder: (BuildContext context, int index) {
              //         return Column(
              //           children: [
              //             ListTile(
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (builder) => EachUserDetails()));
              //               },
              //               leading: CircleAvatar(
              //                 child: Icon(Icons.ac_unit_outlined),
              //               ),
              //               title: Text("Sergio Rodrigz",
              //                   style: TextStyle(
              //                       fontSize: 14, fontWeight: FontWeight.bold)),
              //               subtitle: Text("subscribers"),
              //               trailing: Wrap(
              //                 spacing: 12,
              //                 children: <Widget>[
              //                   Icon(Icons.arrow_forward_ios),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         );
              //       });
              //     }
              //   }),
              // )
            ],
          ),
        ),
      ),
      // body:
      // ListView(
      //   children: [
      //     Column(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(10),
      //           child: TextField(
      //             // textAlign: TextAlign.center,
      //             // controller: searchCtrl,
      //             keyboardType: TextInputType.text,
      //             decoration: InputDecoration(
      //               hintText: 'User & Terminals',
      //               hintStyle: TextStyle(fontSize: 16),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(15),
      //                 borderSide: BorderSide(
      //                   width: 0,
      //                   style: BorderStyle.none,
      //                 ),
      //               ),
      //               filled: true,
      //               contentPadding: EdgeInsets.all(16),
      //               fillColor: Colors.grey[350],
      //               prefixIcon: Icon(
      //                 Icons.search,
      //                 size: 30,
      //               ),
      //             ),
      //           ),
      //         ),
      //         // TextField(
      //         //   decoration: const InputDecoration(
      //         //     border: OutlineInputBorder(
      //         //       borderRadius: BorderRadius.circular(8),
      //         //       borderSide: BorderSide(
      //         //         width: 0,
      //         //         style: BorderStyle.none,
      //         //       ),
      //         //     ),
      //         //     filled: true,
      //         //     prefixIcon: Icon(
      //         //       Icons.search,
      //         //       size: 30,
      //         //     ),
      //         //     hintText: 'Users & Terminals',
      //         //     //  labelText: 'Enter the access code ',
      //         //   ),
      //         // ),
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(14.0),
      //               child: Text(
      //                 'Users',
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Divider(
      //           height: 10,
      //           thickness: 1,
      //           indent: 20,
      //           endIndent: 20,
      //         ),
      //       ],
      //     ),
      //     ListTile(
      //       onTap: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (builder) => EachUserDetails()));
      //       },
      //       leading: CircleAvatar(
      //         child: Icon(Icons.ac_unit_outlined),
      //       ),
      //       title: Text("Sergio Rodrigz",
      //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      //       subtitle: Text("subscribers"),
      //       trailing: Wrap(
      //         spacing: 12,
      //         children: <Widget>[
      //           Icon(Icons.arrow_forward_ios),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       height: 10,
      //       thickness: 1,
      //       indent: 20,
      //       endIndent: 20,
      //     ),
      //     ListTile(
      //       leading: CircleAvatar(
      //         child: Icon(Icons.ac_unit_outlined),
      //       ),
      //       title: Text("Marko Polo",
      //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      //       subtitle: Text("Admin   station:Design Depart.."),
      //       trailing: Wrap(
      //         spacing: 12,
      //         children: <Widget>[
      //           Icon(Icons.arrow_forward_ios),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       height: 10,
      //       thickness: 1,
      //       indent: 20,
      //       endIndent: 20,
      //     ),
      //     Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(14.0),
      //           child: Text(
      //             'Terminals',
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(12.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Token adversedsgafal42352',
      //                     style: TextStyle(
      //                       fontSize: 17,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Pending',
      //                     style: TextStyle(fontSize: 15, color: Colors.red),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //           TextButton(
      //             style: TextButton.styleFrom(
      //               textStyle: const TextStyle(fontSize: 17),
      //             ),
      //             onPressed: () {
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(builder: (context) => User35()),
      //               // );
      //             },
      //             child: const Text(
      //               'Accept',
      //               style: TextStyle(color: Colors.blue),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       height: 10,
      //       thickness: 1,
      //       indent: 20,
      //       endIndent: 20,
      //     ),
      //     ListTile(
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (builder) => TermianlDetailsUser()));
      //       },
      //       leading: CircleAvatar(
      //         child: Icon(Icons.ac_unit_outlined),
      //       ),
      //       title: Text(
      //         'Bending 3 Machine',
      //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      //       ),
      //       subtitle: Text('Station: Bending Depart..'),
      //     ),
      //     Divider(
      //       height: 10,
      //       thickness: 1,
      //       indent: 20,
      //       endIndent: 20,
      //     ),
      //     ListTile(
      //       leading: CircleAvatar(
      //         child: Icon(Icons.ac_unit_outlined),
      //       ),
      //       title: Text(
      //         'Laser',
      //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      //       ),
      //       subtitle: Text('Station'),
      //     ),
      //     Divider(
      //       height: 10,
      //       thickness: 1,
      //       indent: 20,
      //       endIndent: 20,
      //     ),
      //   ],
      // ),
    );
  }

  _onBasicAlertPressed(context, String id, String workspaceId) {
    Alert(
            context: context,
            title: 'Terminal ' + id,
            desc: 'Friently Name  ${workspaceId}')
        .show();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invite your team to Planny'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Invite your colleagues, stuff and partners',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'Enter a valid email address',
                      labelStyle: TextStyle(fontSize: 13),
                      hintText: "Enter a valid email address"),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Sent',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    Future.delayed(Duration(seconds: 2), () async {
                      Navigator.pop(context);
                    });

                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9."
                            r"!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_email.text);
                    if (_email.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Enter a email address',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (emailValid == false) {
                      Fluttertoast.showToast(
                          msg: 'Enter a valid email address',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (emailValid == true & _email.text.isNotEmpty) {
                      InviteUserRequestModel model = InviteUserRequestModel();
                      model.email = _email.text;

                      await inviteUserViewModel.inviteUsers(model);
                      if (inviteUserViewModel.inviteUser.status ==
                          Status.COMPLETE) {
                        InviteUserResponseModel resModel =
                            inviteUserViewModel.inviteUser.data;
                        if (resModel.title == 'success') {
                          Fluttertoast.showToast(
                              msg: resModel.title.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          _email.clear();
                        } else {
                          Fluttertoast.showToast(
                              msg: resModel.title.toString(),
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
                    }
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }
}
