import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/models/sesion.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';

import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompany.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';

import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new HttpProvider();
  Sessions sessions = Sessions();

  bool idsession = await sessions.verificationSession("iduser");
  bool rolsession = await sessions.verificationSession("rol");
  bool googleSession = await sessions.verificationSession("emailGoogle");
  bool facebookSession = await sessions.verificationSession("emailFacebook");
  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
  );
  if (!idsession && !rolsession) {
    app = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'registerVehicle',
      routes: {
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage()
      },
    );
  } else {
    app = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginUser',
      routes: {
        'loginUser': (BuildContext contextFirstScreen) => UserLoginPage()
      },
    );
  }
  //Si existe una sesion Google
  if (googleSession) {
    app = MaterialApp(
      initialRoute: 'scannerQr',
      routes: {'scannerQr': (BuildContext contextFirstScreen) => QRPAGE()},
    );
  }
  //Si Existe una sesion Facebook
  else if (facebookSession) {
    app = MaterialApp(
      initialRoute: 'scannerQr',
      routes: {'scannerQr': (BuildContext contextFirstScreen) => QRPAGE()},
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
      initialRoute: 'registerCompany',
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'scannerQr': (BuildContext contexUserLogin) => QRPAGE(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'registerOwner': (BuildContext contextRegisterOwner) => RegisterOwner(),
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle(),
      },
    );
  }
}
