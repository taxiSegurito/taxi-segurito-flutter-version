import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/pages/companyList/widgets/CompanyListView.dart';
import 'package:taxi_segurito_app/pages/ownerList/widgets/ContainerReplayList.dart';

import 'CompanyListFunctionality.dart';

class CompanyList extends StatefulWidget {
  CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  CompanyListFunctionallity listCompanyFunctionallity =
      new CompanyListFunctionallity();
  CompanyListView companyListView = new CompanyListView();
  @override
  initState() {
    super.initState();
    listCompanyFunctionallity = new CompanyListFunctionallity();
    listCompanyFunctionallity.loaded();
    listCompanyFunctionallity.callUpdateListView = () {
      companyListView.updateListView();
    };
  }

  @override
  Widget build(BuildContext context) {
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    listCompanyFunctionallity.context = context;

    companyListView.setCallbak = (value) {
      listCompanyFunctionallity.onPressedItemListView(value);
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
              listCompanyFunctionallity.onPressedReturn();
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
        listCompanyFunctionallity.onPressedReloadListView();
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
        listCompanyFunctionallity.onPressedSearhCompany(value);
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
