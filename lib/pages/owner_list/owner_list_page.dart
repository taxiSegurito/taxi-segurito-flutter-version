import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';

import 'owner_list_functionality.dart';
import 'widgets/owner_list.dart';
import 'widgets/refresh_button.dart';

class OnwerList extends StatefulWidget {
  OnwerList({Key? key}) : super(key: key);

  @override
  _OnwerListState createState() => _OnwerListState();
}

class _OnwerListState extends State<OnwerList> {
  late OwnerListFunctionallity functionality;
  late OwnerList containerListView;

  @override
  initState() {
    super.initState();
    functionality = OwnerListFunctionallity();
    containerListView = OwnerList();
    functionality.loaded();
    functionality.callUpdateListView = () {
      containerListView.updateListView();
    };
  }

  @override
  Widget build(BuildContext context) {
    functionality.context = context;

    containerListView.setCallbak = (value) {
      functionality.onPressedItemListView(value);
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
              functionality.onPressedReturn();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );

    final containerFilter = new RefreshButton(
      onTap: () {
        functionality.onPressedReloadListView();
      },
    );

    final searchField = new CustomTextFieldSearch(
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 2,
      marginTop: 0,
      heightNum: 35,
      radius: 20,
      hint: 'Buscar por nombre, Ci ...',
      ontap: () {},
      callbackValueSearch: (value) {
        functionality.onPressedSearhUserData(value);
      },
    );

    final searchbar = new Container(
      margin:
          new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Row(
        children: [Expanded(flex: 2, child: searchField), containerFilter],
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
            searchbar,
            Expanded(
              child: Container(child: containerListView),
            )
          ],
        ),
      ),
    );
  }
}
