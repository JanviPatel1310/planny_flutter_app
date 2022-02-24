import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/requestModal/taskCreate.dart';
import 'package:plany_app/modal/apiModel/responseModal/taskCreate.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';
import 'package:plany_app/viewModal/register_view_model.dart';

class TaskCreate extends StatefulWidget {
  const TaskCreate({Key key}) : super(key: key);

  @override
  _TaskCreateState createState() => _TaskCreateState();
}

class _TaskCreateState extends State<TaskCreate> {
  GetUserViewModel getUserViewModel = Get.find();
  TextEditingController _taskname = new TextEditingController();
  TextEditingController _quantity = new TextEditingController();
  EditContactViewModel createTaskViewModel = Get.put(EditContactViewModel());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      TaskCreateRequestModel model = TaskCreateRequestModel();
                      model.title = _taskname.text;
                      model.quantity = _quantity.text;
                      await createTaskViewModel.createTask(model);
                      if (createTaskViewModel.taskCreateResponse.status ==
                          Status.COMPLETE) {
                        TaskCreateResponseModel resModel =
                            createTaskViewModel.taskCreateResponse.data;
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
                          // Future.delayed(Duration(seconds: 2), () async {
                          //   Get.off(MyDrawers());
                          // });
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
                    // SharedPreferences prefs =
                    // await SharedPreferences.getInstance();
                    // if (_stationname.text.isNotEmpty) {
                    //   prefs.setString('stationname', _stationname.text);
                    //   Get.to(StationEdit());
                    //   //Redirect to edit station name
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg: 'Enter Station Name',
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Task create'),
        ),
        body: Form(
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task name';
                      }
                      return null;
                    },
                    controller: _taskname,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        hintText: "Tiltle"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter quantity';
                      }
                      return null;
                    },
                    controller: _quantity,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        hintText: "Quantity"),
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
