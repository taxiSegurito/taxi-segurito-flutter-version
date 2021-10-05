import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/pages/listUsers/widgets/ContainerFilter.dart';

class ListUser extends StatefulWidget {
  ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
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

  @override
  Widget build(BuildContext context) {
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
        margin: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: Row(
          children: [
            Expanded(flex: 2, child: txtSearch),
            Expanded(flex: 1, child: containerFilter)
          ],
        ));

    return Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
            child: Column(children: [
          containerSearch,
        ])));
  }
}
