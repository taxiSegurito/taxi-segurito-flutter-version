import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

// ignore: must_be_immutable
class DriverInfoPage extends StatefulWidget {
  late Driver _driver;
  DriverInfoPage(this._driver, {Key? key}) : super(key: key);

  @override
  DriverInfoPageState createState() => DriverInfoPageState();
}

class DriverInfoPageState extends State<DriverInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de conductor"),
      ),
      body: Center(
        child: Text("${widget._driver.fullName}"),
      ),
    );
  }
}
