import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/responseModal/terminalDetails.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';

class TerminalDetails extends StatefulWidget {
  @override
  _TerminalDetailsState createState() => _TerminalDetailsState();
}

class _TerminalDetailsState extends State<TerminalDetails> {
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());
  var id = Get.arguments;
  @override
  void initState() {
    super.initState();
    print(id);
    getUserViewModel.getTerminalDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue,
            )),
        title: Text(
          'Terminal Details',
          style: TextStyle(
            color: Colors.black,
            // fontSize: 12,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  height: 300,
                  child: GetBuilder<GetUserViewModel>(
                    builder: (controller) {
                      if (controller.apiResponseTerminalDetails.status ==
                          Status.LOADING) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.apiResponseTerminalDetails.status ==
                          Status.ERROR) {
                        return Center(child: Text('Server Error'));
                      }

                      TerminalDetailsResponseModel responseModel =
                          controller.apiResponseTerminalDetails.data;
                      print(
                          'Terminal DETAILS RESPONSE -----${responseModel.result.terminal.length}');
                      return ListView.builder(
                          itemCount: responseModel.result.terminal.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile();
                          });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
