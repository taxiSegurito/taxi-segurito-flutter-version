import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/pages/listUsers/ListUserFunctionallity.dart';
import 'package:taxi_segurito_app/pages/listUsers/widgets/ContainerReplayList.dart';
import 'package:taxi_segurito_app/pages/listUsers/widgets/ContainerListView.dart';

class ListUser extends StatefulWidget {
  ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  ListUserFunctionallity listUserFunctionallity = new ListUserFunctionallity();
  ContainerListView containerListView = new ContainerListView();

  @override
  initState() {
    super.initState();
    listUserFunctionallity = new ListUserFunctionallity();
    containerListView = new ContainerListView();
    listUserFunctionallity.loaded();
    listUserFunctionallity.callUpdateListView = () {
      containerListView.updateListView();
    };
  }

  @override
  Widget build(BuildContext context) {
    listUserFunctionallity.context = context;

    containerListView.setCallbak = (value) {
      listUserFunctionallity.onPressedItemListView(value);
    };

    AppBar appbar = new AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Dueños",
        textAlign: TextAlign.right,
        style: TextStyle(),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              listUserFunctionallity.onPressedReturn();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );

    ContainerReplayList containerFilter = new ContainerReplayList(
      onTap: () {
        listUserFunctionallity.onPressedReloadListView();
      },
    );

    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 2,
      marginTop: 0,
      heightNum: 35,
      radius: 20,
      hint: 'Buscar por nombre, Ci ...',
      ontap: () {},
      callbackValueSearch: (value) {
        listUserFunctionallity.onPressedSearhUserData(value);
      },
    );

    Container containerSearch = new Container(
      margin:
          new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Row(
        children: [Expanded(flex: 2, child: txtSearch), containerFilter],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
