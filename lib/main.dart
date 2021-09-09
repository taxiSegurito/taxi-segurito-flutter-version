import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/overrides.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(AppTaxiSegurito());
}

class AppTaxiSegurito extends StatefulWidget {
  const AppTaxiSegurito({Key? key}) : super(key: key);

  @override
  _AppTaxiSeguritoState createState() => _AppTaxiSeguritoState();
}

class _AppTaxiSeguritoState extends State<AppTaxiSegurito> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taxi Segurito",
      initialRoute: 'loginUser',
      routes: {'loginUser': (BuildContext contexUserLogin) => UserLoginPage()},
    );
  }
}
