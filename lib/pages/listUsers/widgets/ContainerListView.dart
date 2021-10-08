import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/listUsers/ListUserFunctionallity.dart';
import 'package:taxi_segurito_app/pages/listUsers/models/UserData.dart';

import 'ContainerUser.dart';

class ContainerListView extends StatefulWidget {
  List<UserData>? listDataUser = listUserData;
  _ContainerListViewState _containerListViewState =
      new _ContainerListViewState();
  ContainerListView({Key? key}) : super(key: key);

  @override
  _ContainerListViewState createState() {
    return _containerListViewState;
  }

  updateListView() {
    _containerListViewState.updateListView();
  }
}

class _ContainerListViewState extends State<ContainerListView> {
  updateListView() {
    setState(() {
      widget.listDataUser = listUserData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return new Container(
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
  }
}
