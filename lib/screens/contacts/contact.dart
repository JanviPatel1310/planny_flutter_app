import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany_app/modal/apiModel/responseModal/get_contact_response_model.dart';
import 'package:plany_app/modal/apis/api_response.dart';
import 'package:plany_app/viewModal/get_user_viewModel.dart';

import 'contactdetails.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  GetUserViewModel getUserViewModel = Get.put(GetUserViewModel());

  @override
  void initState() {
    // TODO: implement initState
    getUserViewModel.getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<GetUserViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.apiResponse.status == Status.ERROR) {
            return Center(child: Text('Server Error'));
          }
          GetContactResponseModel responseModel = controller.apiResponse.data;
          print('CONTACT RES -----$responseModel');
          print(responseModel.result.contact.length.toString());

          return ListView.builder(
              itemCount: responseModel.result.contact.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.ac_unit_outlined),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(ContactDetails(), arguments: [
                      responseModel.result.contact[index].name,
                      responseModel.result.contact[index].email,
                      responseModel.result.contact[index].phone,
                      responseModel.result.contact[index].id.toString(),
                    ]);
                  },
                  title: Text(responseModel.result.contact[index].name),
                  subtitle: Text(responseModel.result.contact[index].email),
                );
              });
        },
      )

      /*FutureBuilder(
          future: WorkspaceListRepo.contactsModel(
              Base_URL + contacts, AuthToken, Domain),
          builder:
              (BuildContext context, AsyncSnapshot<ContactsModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.result.contact.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.ac_unit_outlined),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Get.to(ContactDetails(), arguments: [
                            snapshot.data!.result.contact[index].name,
                            snapshot.data!.result.contact[index].email,
                            snapshot.data!.result.contact[index].phone,
                            snapshot.data!.result.contact[index].id.toString()
                          ]);
                        },
                        title: Text(snapshot.data!.result.contact[index].name),
                        subtitle:
                            Text(snapshot.data!.result.contact[index].email),
                      );
                    });
              } else {
                return Center(
                  child: Text('NO DATA FOUND'),
                );
              }
            }
            return Center(child: CircularProgressIndicator());
            // return ListView.builder(
            //     itemCount: snapshot.data!.result.contact.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return CircularProgressIndicator();
            //       } else if (snapshot.connectionState == ConnectionState.done) {
            //         if (snapshot.hasData == '') {
            //           return SizedBox();
            //         } else if (snapshot.hasData) {
            //           return ListTile(
            //               title:
            //                   Text(snapshot.data!.result.contact[index].name));
            //         } else {
            //           return Center(child: CircularProgressIndicator());
            //         }
            //       } else {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //     });
          })*/
      ,
      // ListView.builder(
      //   itemCount: 7,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (builder) => ContactDetails()));
      //         },
      //         leading: CircleAvatar(
      //           child: Icon(Icons.ac_unit_outlined),
      //         ),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         title: Text(
      //           "#151 Papadopoulus SA ",
      //           style: TextStyle(fontWeight: FontWeight.bold),
      //         ));
      //   },
      // ),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Screen27()),
                // );
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
