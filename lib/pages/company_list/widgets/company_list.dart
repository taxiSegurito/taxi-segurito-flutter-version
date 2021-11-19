import 'package:flutter/material.dart';
import '../company_list_functionality.dart';
import 'company_list_item.dart';

class CompanyList extends StatefulWidget {
  List<dynamic>? listDataUser = listCompany;
  void Function(dynamic dynamicObject)? callback;
  _CompanyListState _containerListViewState = new _CompanyListState();
  CompanyList({Key? key, this.callback}) : super(key: key);

  @override
  _CompanyListState createState() {
    return _containerListViewState;
  }

  set setCallbak(function) {
    this.callback = function;
  }

  updateListView() {
    _containerListViewState.updateListView();
  }
}

class _CompanyListState extends State<CompanyList> {
  updateListView() {
    setState(
      () {
        widget.listDataUser = listCompany;
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
        itemCount: listCompany.length,
        itemBuilder: (context, index) {
          dynamic dinamycOb = listCompany[index];
          return new CompanyListItem(
            company: dinamycOb,
            callbackCompany: (value) {
              widget.callback!(value);
            },
          );
        },
      ),
    );
  }
}
