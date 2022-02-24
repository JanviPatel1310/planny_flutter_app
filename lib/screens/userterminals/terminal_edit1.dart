import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/requestModal/terminalEdit.dart';
import 'package:plany_app/modal/apiModel/responseModal/station_list_response.dart';
import 'package:plany_app/modal/apiModel/responseModal/updateTerminal.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class TerminalEdit1 extends StatefulWidget {
  TerminalEdit1({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TerminalEdit1> {
  EditContactViewModel editWorksapceViewModel = Get.put(EditContactViewModel());
  EditContactViewModel editTerminalViewModel = Get.put(EditContactViewModel());
  var data = Get.arguments;
  bool status = false;
  String lock = 0.toString();
  final _stationId = TextEditingController();
  final _createdAt = TextEditingController();
  final _token = TextEditingController();
  final _lock = TextEditingController();
  final _frientlyName = TextEditingController();

  File _image;
  TextEditingController _workspacename = new TextEditingController();
  TextEditingController _hexcolor = new TextEditingController();
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());

  @override
  void initState() {
    super.initState();
    // callStationList();
  }

  String dropdownvalue1;

  @override
  Widget build(BuildContext context) {
    var _user;
    // _stationId.text = data[1];
    _createdAt.text = data[2];
    _lock.text = lock;
    String id = data[3];
    _frientlyName.text = data[4];
    List<String> stationName = [];
    var items1 = [
      'Cuttting Station',
      'Accounding station',
      'Assemply station',
      'Bending station',
    ];
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: Colors.blue,
                size: 35,
              )),
        ],
        title: Text(
          data[0],
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 19),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('Delete', style: TextStyle(color: Colors.blue)),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Save', style: TextStyle(color: Colors.blue)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    UpdateTerminalRequestModel model =
                        UpdateTerminalRequestModel();
                    model.friently_name = _frientlyName.text;
                    model.station_id = _stationId.text;
                    model.token1 = _token.text;
                    model.created_at = _createdAt.text;
                    model.locked = _lock.text;
                    await editTerminalViewModel.editTerminal(model, id);
                    if (editTerminalViewModel.terminalUpdateResponse.status ==
                        Status.COMPLETE) {
                      UpdateTerminalResponseModel resModel =
                          editTerminalViewModel.terminalUpdateResponse.data;
                      if (resModel.title == 'success') {
                        Fluttertoast.showToast(
                            msg: resModel.title.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Future.delayed(Duration(seconds: 1), () async {
                          Get.back();
                          await getUserViewModel.getTerminalList();
                          dropdownvalue1 = null;
                          // Get.off(MyDrawers());
                        });
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
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                      controller: _frientlyName,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Friently Name',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(height: 10),
                  GetBuilder<GetUserViewModel>(
                    builder: (controller) {
                      if (controller.apiResponseStation.status ==
                          Status.LOADING) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.apiResponseStation.status ==
                          Status.ERROR) {
                        return Center(child: Text('Server Error'));
                      }

                      StationListResponseModel responseModel =
                          controller.apiResponseStation.data;
                      // if (responseModel.result.stations.length > 0) {
                      //   checkStationExists1();
                      // }
                      print('Station RES -----$responseModel');
                      for (int index = 0;
                          index < responseModel.result.stations.length;
                          index++) {
                        // int index = 0;
                        print(index);
                        stationName.add(responseModel
                            .result.stations[index].name
                            .toString());
                        // index = index + 1;
                        // print('STATIONS${stationName}');
                      }
                      return Column(
                        children: List.generate(1, (index) {
                          // stationName.add(responseModel
                          //     .result.stations[index].name
                          //     .toString());
                          print(stationName);
                          return Container(
                            width: double.infinity,
                            child: DropdownButton(
                              value: dropdownvalue1,
                              hint: Text('Select Station'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: stationName.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue1 = newValue;
                                  print(dropdownvalue1);
                                  _user = stationName.indexOf(newValue);
                                  print(_user);
                                  var str = _user + 1;
                                  print('INDEX${str}');
                                  _stationId.text = str.toString();
                                  print(_stationId);
                                  // if (dropdownvalue1 ==
                                  //     responseModel
                                  //         .result.stations[index].name) {
                                  //   print('********');
                                  //   print(responseModel
                                  //       .result.stations[index].id);
                                  // }
                                });
                              },
                            ),
                          );
                          // return Container(
                          //   width: double.infinity,
                          //   child: DropdownButton(
                          //     value: dropdownvalue1,
                          //     hint: Text('Select Station'),
                          //     icon: const Icon(Icons.keyboard_arrow_down),
                          //     items: stationName.map((String items) {
                          //       return DropdownMenuItem(
                          //         value: items,
                          //         child: Text(items),
                          //       );
                          //     }).toList(),
                          //     onChanged: (String newValue) {
                          //       setState(() {
                          //         dropdownvalue1 = newValue;
                          //       });
                          //     },
                          //   ),
                          // );
                        }),
                      );
                    },
                  ),
                  TextField(
                      enabled: false,
                      controller: _stationId,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Station id',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      enabled: false,
                      controller: _createdAt,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Created At',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter token';
                        }
                        return null;
                      },
                      controller: _token,
                      decoration: InputDecoration(
                        label: Text('Token',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Flexible(
                          child: TextField(
                        enabled: false,
                        controller: _lock,
                        decoration: InputDecoration(
                          label: status == true
                              ? Text('Uncloked',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ))
                              : Text('Locked',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Wrap(
                          children: [
                            Icon(Icons.lock),
                            SizedBox(width: 10),
                            FlutterSwitch(
                              width: 75.0,
                              height: 35.0,
                              valueFontSize: 15.0,
                              toggleSize: 25.0,
                              value: status,
                              borderRadius: 25.0,
                              padding: 8.0,
                              // showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                  print(status);
                                  if (status == true) {
                                    lock = 1.toString();
                                    // Get.changeTheme(ThemeData.dark());
                                  } else {
                                    lock = 0.toString();
                                    // Get.changeTheme(ThemeData.light());
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.lock_open),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
