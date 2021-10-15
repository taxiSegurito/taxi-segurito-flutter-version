import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/pages/listUsers/ListUser.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';
import 'package:taxi_segurito_app/pages/register/register_page_phone.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistration.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';
import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompany.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicle.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleScreen.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/UpdateVehicleScreen.dart';

import 'models/Company.dart';

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
    app = AppTaxiSegurito("updateVehicleScreen");
  } else {
    var rol = await sessions.getSessionValue("rol");
    if (rol.toString() == "Administrador") {
      app = AppTaxiSegurito("registerOwner");
    }
    if (rol.toString() == "Dueño") {
      app = AppTaxiSegurito("driverList");
    }
    if (rol.toString() == "Cliente") {
      app = AppTaxiSegurito("QRpage");
    }
  }
  runApp(app);
}

class AppTaxiSegurito extends StatefulWidget {
  final String initialRoute;
  AppTaxiSegurito(this.initialRoute);
  @override
  _AppTaxiSeguritoState createState() => _AppTaxiSeguritoState(initialRoute);
}

class _AppTaxiSeguritoState extends State<AppTaxiSegurito> {
  String routeInitial;
  _AppTaxiSeguritoState(this.routeInitial);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taxi Segurito",
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      initialRoute: routeInitial,
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerScreen': (BuildContext contextFirstScreen) => RegisterPage(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'registerOwner': (BuildContext contextRegisterOwner) => RegisterOwner(),
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle(),
        'driverRegistration': (BuildContext contextRegistration) =>
            DriverRegistration(),
        'driverList': (BuildContext contextDriveList) => DriversList(),
        'QRpage': (BuildContext contextDriveList) => QRPAGE(),
        'userList': (BuildContext contextUserList) => ListUser(),
        'registerVehicleScreen': (BuildContext contextss) =>
            RegisterVehicleScreen(),
        'updateVehicleScreen': (BuildContext contextss) => UpdateVehicleScreen(
            Vehicle(
                capacity: "1 kilo",
                color: "rojo con franjas verdes",
                model: "Lamborginy",
                pleik: "sdasd",
                photo: "sadasd",
                owner_idOwner: "2",
                report_car_idReports: "sdasd")),
        'updateCompany': (BuildContext contextUpdateCompany, {company}) =>
            RegisterCompany.fromRegisterCompany(company: company)
      },
    );
  }
}
