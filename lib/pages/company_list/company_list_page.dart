import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/buttons/refresh_button.dart';
import 'package:taxi_segurito_app/components/inputs/search_field.dart';
import 'package:taxi_segurito_app/pages/company_list/widgets/company_list.dart';

import 'company_list_functionality.dart';

class CompanyListPage extends StatefulWidget {
  CompanyListPage({Key? key}) : super(key: key);

  @override
  _CompanyListPageState createState() => _CompanyListPageState();
}

class _CompanyListPageState extends State<CompanyListPage> {
  CompanyListFunctionallity functionality = new CompanyListFunctionallity();
  CompanyList companyListView = new CompanyList();
  @override
  initState() {
    super.initState();
    functionality = new CompanyListFunctionallity();
    functionality.loaded();
    functionality.callUpdateListView = () {
      companyListView.updateListView();
    };
  }

  @override
  Widget build(BuildContext context) {
    functionality.context = context;

    companyListView.setCallbak = (value) {
      functionality.onPressedItemListView(value);
    };

    AppBar appbar = new AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Text(
        "Compañias",
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

    Widget searchField = SearchField(
      onSearch: functionality.onPressedSearhCompany,
      hint: 'Buscar por nombre compañia o nit',
    );

    Widget searchBar = new Container(
      margin:
          new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:
                Padding(padding: EdgeInsets.only(right: 8), child: searchField),
          ),
          RefreshButton(functionality.onPressedReloadListView),
        ],
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
            searchBar,
            Expanded(child: Container(child: companyListView))
          ],
        ),
      ),
    );
  }
}
