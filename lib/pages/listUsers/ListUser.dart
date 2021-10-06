import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/pages/listUsers/models/UserData.dart';
import 'package:taxi_segurito_app/pages/listUsers/widgets/ContainerFilter.dart';
import 'package:taxi_segurito_app/pages/listUsers/widgets/ContainerUser.dart';

class ListUser extends StatefulWidget {
  ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    AppBar appbar = new AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Usuarios",
        textAlign: TextAlign.right,
        style: TextStyle(),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );
    ContainerFilter containerFilter = new ContainerFilter();

    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
        marginBotton: 0,
        marginLeft: 0,
        marginRight: 2,
        marginTop: 0,
        heightNum: 35,
        radius: 20,
        hint: '',
        ontap: () {},
        callbackValueSearch: (value) {});

    Container containerSearch = new Container(
      margin:
          new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: txtSearch),
          Expanded(flex: 1, child: containerFilter)
        ],
      ),
    );
    /*String id;
  String name;
  String dni;
  String phone;
  String rol;
  Image photo;*/
    Image photo = Image.asset("lib/components/assets/images/driver.jpg");
    //ImageProvider img = Image.asset(name)
    List<UserData> listUserData = [
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData(
          "1", "Juan Jimenes", "12345678", "12345678", "Dueño", photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
      UserData("1", "Juan Jimenes", "12345678", "12345678", "Conductor",
          photo.image),
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Container containerListView = new Container(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: listUserData.length,
        itemBuilder: (context, index) {
          dynamic dinamycOb = listUserData[index];
          return new ContainerUser(dynamicObject: dinamycOb);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            containerSearch,
            Expanded(
              child: Container(child: containerListView),
            )
          ],
        ),
      ),
    );
  }
}
