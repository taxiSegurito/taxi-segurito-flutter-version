import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicle.dart';

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
      initialRoute: 'registerOwnerAndVehicle',
      routes: {
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerOwnerAndVehicle':
            (BuildContext contextRegisterOwnerAndVehicle) =>
                RegisterOwnerAndVehicle(),
      },
    );
  }
}
