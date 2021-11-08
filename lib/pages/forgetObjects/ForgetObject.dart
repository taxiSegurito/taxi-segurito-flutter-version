import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/ForgetObjects.dart';
import 'package:taxi_segurito_app/pages/forgetObjects/widgets/ContainerForgetObjects.dart';
import 'package:taxi_segurito_app/services/ForgetObjectsCrud.dart';

class ForgetObjects extends StatefulWidget {
  ForgetObjects({Key? key}) : super(key: key);

  @override
  _ForgetObjectsState createState() => _ForgetObjectsState();
}

class _ForgetObjectsState extends State<ForgetObjects> {
  @override
  void initState() {
    super.initState();
    updateData();
  }

  List<ForgetObjectsList> listLost = [];
  updateData() {
    getLostObjects().then((value) {
      setState(() {
        listLost = value;
      });
    });
  }
  Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    Color colorButton = Color.fromRGBO(242, 176, 53, 1);  

  @override
  Widget build(BuildContext context) {
      CustomButton btnFilter = new CustomButton(
      onTap: () {
        setState((){
            updateData();
        });
      },
      buttonText: "Refrescar",
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 5,
      marginRight: 0,
      marginTop: 0,

    );

        Container containerButtons = new Container(
        alignment: Alignment.centerLeft,
        margin: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: btnFilter),
          ],
        ));
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    Container containerListView = new Container(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: listLost.length,
        itemBuilder: (context, index) {
          dynamic dinamycOb = listLost[index];
          return new ContainerForgetObjects(dynamicObject: dinamycOb);
        },
      ),
    );
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
        title: Text("Objetos perdidos"),
        centerTitle: false,
        backgroundColor: colorMain,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(child: containerListView),
            ),
            containerButtons,
          ],
        ),
      ),
    );
  }
}