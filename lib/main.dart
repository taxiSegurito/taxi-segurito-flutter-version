import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompany.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicle.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicle.dart';

void main() => runApp(AppTaxiSegurito());

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
      debugShowCheckedModeBanner: false,
      initialRoute: 'registerOwner',
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerOwnerAndVehicle':
            (BuildContext contextRegisterOwnerAndVehicle) =>
                RegisterOwnerAndVehicle(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompany(),
        'registerOwner': (BuildContext contextRegisterOwner) => RegisterOwner(),
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicle()
      },
    );
  }
}
