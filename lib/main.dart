import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/models/sesion.dart';
import 'package:taxi_segurito_app/pages/listUsers/ListUser.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistration.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';

import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompany.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';

import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new HttpProvider();
  Sessions sessions = Sessions();

  bool idsession = await sessions.verificationSession("iduser");
  bool rolsession = await sessions.verificationSession("rol");
  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
  );
  if (!idsession && !rolsession) {
    app = MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'registerCompany',
      routes: {
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle(),
        'listUser': (BuildContext contextListUser) => ListUser(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'driverRegistration': (BuildContext contextRegistration) =>
            DriverRegistration(),
        'driverList': (BuildContext contextDriveList) => DriversList()
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
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      initialRoute: 'firstScreen',
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'registerOwner': (BuildContext contextRegisterOwner) => RegisterOwner(),
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle(),
        'driverRegistration': (BuildContext contextRegistration) =>
            DriverRegistration(),
        'driverList': (BuildContext contextDriveList) => DriversList()
      },
    );
  }
}
