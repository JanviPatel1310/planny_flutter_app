import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/requestModal/createTerminal.dart';
import 'package:plany_app/modal/apiModel/responseModal/createTerminal.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class TermianlCreate extends StatefulWidget {
  // final List<dynamic> names;
  // const TermianlCreate({Key key, this.names}) : super(key: key);

  @override
  _TermianlDetailsUserState createState() => _TermianlDetailsUserState();
}

class _TermianlDetailsUserState extends State<TermianlCreate> {
  bool status = false;
  String lock = 0.toString();
  var data = Get.arguments;
  final _stationId = TextEditingController();
  final _friendlyName = TextEditingController();
  final _token = TextEditingController();
  final _lock = TextEditingController();
  EditContactViewModel createTerminalViewModel =
      Get.put(EditContactViewModel());
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  String dropdownvalue;
  @override
  Widget build(BuildContext context) {
    // print(data[0]);
    // var items = data;
    _stationId.text = data;
    _lock.text = lock;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
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
                    CreateTerminalRequestModel model =
                        CreateTerminalRequestModel();
                    model.friently_name = _friendlyName.text;
                    model.station_id = _stationId.text;
                    model.token1 = _token.text;
                    model.locked = _lock.text;
                    await createTerminalViewModel.createTerminal(model);
                    if (createTerminalViewModel.terminalCreateResponse.status ==
                        Status.COMPLETE) {
                      CreateTerminalResponseModel resModel =
                          createTerminalViewModel.terminalCreateResponse.data;
                      if (resModel.title == 'success') {
                        Fluttertoast.showToast(
                            msg: resModel.title.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        // getUserViewModel.getTaskList();
                        Get.back();
                        Future.delayed(Duration(seconds: 1), () async {
                          getUserViewModel.getTerminalList();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
        centerTitle: true,
        title: Text(
          'Bending 3 Machine',
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  height: 60,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //  shape:BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Text('BS',
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                title: Text('Bending 3 Machine'),
                subtitle: Text(
                  'Station Depending Department',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),
              Text(
                '  Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter friendly name';
                          }
                          return null;
                        },
                        controller: _friendlyName,
                        decoration: InputDecoration(
                          label: Text('Friendly Name',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        )),
                    SizedBox(height: 10),
                    // Container(
                    //   width: double.infinity,
                    //   child: DropdownButton(
                    //     isExpanded: true,
                    //     value: dropdownvalue,
                    //     icon: Icon(Icons.keyboard_arrow_down),
                    //     items: items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String newValue) {
                    //       setState(() {
                    //         dropdownvalue = newValue;
                    //       });
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
