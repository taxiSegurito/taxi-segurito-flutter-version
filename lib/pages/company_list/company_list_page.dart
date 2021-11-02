import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/pages/company_list/widgets/company_list.dart';
import 'package:taxi_segurito_app/pages/owner_list/widgets/refresh_button.dart';

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
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
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

    RefreshButton containerFilter = new RefreshButton(
      onTap: () {
        functionality.onPressedReloadListView();
      },
    );

    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 2,
      marginTop: 0,
      heightNum: 35,
      radius: 20,
      hint: 'Buscar por nombre compañia o nit',
      ontap: () {},
      callbackValueSearch: (value) {
        functionality.onPressedSearhCompany(value);
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
            Expanded(child: Container(child: companyListView))
          ],
        ),
      ),
    );
  }
}
