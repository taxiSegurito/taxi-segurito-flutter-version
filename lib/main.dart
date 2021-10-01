import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/models/sesion.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new HttpProvider();
  Sessions sessions = Sessions();
  bool idsession = await sessions.verificationSession("iduser");
  bool rolsession = await sessions.verificationSession("rol");
  Widget app = MaterialApp();
  if (!idsession && !rolsession) {
    app = MaterialApp(
      initialRoute: 'firstScreen',
      routes: {
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage()
      },
    );
  } else {
    app = MaterialApp(
      initialRoute: 'loginUser',
      routes: {
        'loginUser': (BuildContext contextFirstScreen) => UserLoginPage()
      },
    );
  }
  runApp(app);
}

class AppTaxiSegurito extends StatefulWidget {
  @override
  _AppTaxiSeguritoState createState() => _AppTaxiSeguritoState();
}

class _AppTaxiSeguritoState extends State<AppTaxiSegurito> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taxi Segurito",
      debugShowCheckedModeBanner: false,
      initialRoute: 'firstScreen',
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow()
      },
    );
  }
}
