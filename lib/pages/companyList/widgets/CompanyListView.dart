import 'package:flutter/material.dart';
import '../CompanyListFunctionality.dart';

import 'CompanyData.dart';

class CompanyListView extends StatefulWidget {
  List<dynamic>? listDataUser = listCompany;
  void Function(dynamic dynamicObject)? callback;
  _CompanyListViewState _containerListViewState = new _CompanyListViewState();
  CompanyListView({Key? key, this.callback}) : super(key: key);

  @override
  _CompanyListViewState createState() {
    return _containerListViewState;
  }

  set setCallbak(function) {
    this.callback = function;
  }

  updateListView() {
    _containerListViewState.updateListView();
  }
}

class _CompanyListViewState extends State<CompanyListView> {
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
          return new CompanyData(
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
