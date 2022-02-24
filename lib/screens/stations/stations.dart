import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plany_app/modal/apiModel/responseModal/station_list_response.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalDelete.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalList.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/screens/bottomsections/mywork.dart';
import 'package:plany_app/screens/stations/stationdetail.dart';
import 'package:plany_app/screens/stations/update_station.dart';
import 'package:plany_app/screens/userterminals/terminal_create.dart';
import 'package:plany_app/screens/userterminals/terminal_edit.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stations extends StatefulWidget {
  // List<String> names = <String>[];
  //
  // Stations.name(this.names);

  @override
  _StationsState createState() => _StationsState();
}

class _StationsState extends State<Stations> {
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  EditContactViewModel deleteTerminalViewModel =
      Get.put(EditContactViewModel());
  @override
  void initState() {
    // TODO: implement initState
    getUserViewModel.getStation();
    getUserViewModel.getTerminalList();
    super.initState();
  }

  var status1;
  checkStationExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status1 = prefs.getBool('isStationExists');
    print("status1----------");
    print(status1);
  }

  checkStationExists1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isStationExists', true);
    checkStationExists();
  }

  List stationName = [];
  String _stationName;
  List<StationListResponseModel> stations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue,
            )),
        centerTitle: true,
        title: Text(
          'Stations and workflows',
          style: TextStyle(
            color: Colors.black,
            // fontSize: 12,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz, color: Colors.blue),
          )
        ],
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          backgroundColor: Colors.blue,
          children: [
            SpeedDialChild(
                label: 'Station',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => StationDetail()));
                }),
            SpeedDialChild(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => MyWork()));
              },
              label: 'Workflow',
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefix: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: (' Search inside workspace only'),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Stations',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            GetBuilder<GetUserViewModel>(
              builder: (controller) {
                if (controller.apiResponseStation.status == Status.LOADING) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.apiResponseStation.status == Status.ERROR) {
                  return Center(child: Text('Server Error'));
                }

                StationListResponseModel responseModel =
                    controller.apiResponseStation.data;
                if (responseModel.result.stations.length > 0) {
                  checkStationExists1();
                }
                print('Station RES -----$responseModel');
                return Column(
                  children: List.generate(responseModel.result.stations.length,
                      (index) {
                    stationName.add(
                        responseModel.result.stations[index].name.toString());
                    _stationName = responseModel.result.stations[index].name;
                    // print("responseModel.result.stations[index].name");
                    // print(responseModel.result.stations[index].name);
                    String colorString =
                        responseModel.result.stations[index].color.toString();
                    print("Color UPDATED");
                    print('$colorString');
                    String valueString =
                        colorString.split('(0x')[1].split(')')[0];
                    int value = int.parse(valueString, radix: 16);
                    Color otherColor = new Color(value);

                    return ListTile(
                      onTap: () {
                        Get.to(UpdateStation(), arguments: [
                          responseModel.result.stations[index].name,
                          responseModel.result.stations[index].color,
                          otherColor,
                          responseModel.result.stations[index].id.toString(),
                        ]);
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: otherColor,
                      ),
                      trailing: TextButton(
                          // color: Colors.blue,
                          child: Text(
                            'Create Terminal',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Get.to(TermianlCreate(),
                                arguments: responseModel
                                    .result.stations[index].id
                                    .toString());
                          }),
                      title: Text(responseModel.result.stations[index].name),
                      // subtitle: Text(
                      //     responseModel.result.stations[index].id.toString()),
                    );
                  }),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
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
                if (controller.apiResponseTerminalList.status == Status.ERROR) {
                  return Center(child: Text('Server Error'));
                }

                TerminalListResponseModel responseModel =
                    controller.apiResponseTerminalList.data;
                print('Terminal RES -----$responseModel');
                return Column(
                  children: List.generate(responseModel.result.terminals.length,
                      (index) {
                    String date = DateFormat('dd-MM-yyyy').format(
                        responseModel.result.terminals[index].createdAt);
                    return ListTile(
                      onTap: () {
                        _onBasicAlertPressed(
                            context,
                            responseModel.result.terminals[index].id.toString(),
                            responseModel.result.terminals[index].frientlyName
                                .toString());
                      },
                      trailing: Wrap(
                        children: [
                          TextButton(
                              // color: Colors.blue,
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Get.to(
                                  TerminalEdit(),
                                  arguments: [
                                    responseModel
                                        .result.terminals[index].frientlyName,
                                    responseModel
                                        .result.terminals[index].stationId
                                        .toString(),
                                    date,
                                    responseModel.result.terminals[index].id
                                        .toString(),
                                    responseModel
                                        .result.terminals[index].frientlyName
                                  ],
                                );
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                String id = responseModel
                                    .result.terminals[index].id
                                    .toString();
                                print(id);
                                await deleteTerminalViewModel
                                    .deleteTerminal(id);
                                if (deleteTerminalViewModel
                                        .terminalDeleteResponse.status ==
                                    Status.COMPLETE) {
                                  TerminalDeleteResponseModel resModel =
                                      deleteTerminalViewModel
                                          .terminalDeleteResponse.data;
                                  if (responseModel.title == 'success') {
                                    Fluttertoast.showToast(
                                        msg: responseModel.title.toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Future.delayed(Duration(seconds: 1),
                                        () async {
                                      getUserViewModel.getTerminalList();
                                      // Get.off(MyDrawers());
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: responseModel.title.toString(),
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
          ],
        ),
      ),
    );
  }

  _onBasicAlertPressed(context, String id, String workspaceId) {
    Alert(
            context: context,
            title: 'Terminal ' + id,
            desc: 'Friently Name  ${workspaceId}')
        .show();
  }
}
