import 'package:flutter/material.dart';
import '../owner_list_functionality.dart';
import 'owner_list_item.dart';

class OwnerList extends StatefulWidget {
  List<dynamic>? listDataUser = listUserData;
  void Function(dynamic dynamicObject)? callback;
  _OwnerListState _containerListViewState = new _OwnerListState();
  OwnerList({Key? key, this.callback}) : super(key: key);

  @override
  _OwnerListState createState() {
    return _containerListViewState;
  }

  set setCallbak(function) {
    this.callback = function;
  }

  updateListView() {
    _containerListViewState.updateListView();
  }
}

class _OwnerListState extends State<OwnerList> {
  updateListView() {
    setState(
      () {
        widget.listDataUser = listUserData;
      },
    );
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
          return new OwnerListItem(
            dynamicObject: dinamycOb,
            callback: (value) {
              widget.callback!(value);
            },
          );
        },
      ),
    );
  }
}
