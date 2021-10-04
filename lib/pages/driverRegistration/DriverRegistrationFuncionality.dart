import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';

class DriverRegistrationFuncionality {
  BuildContext context;
  String? names;
  String? lastName;
  String? secondLastName;
  String? driverCI;
  String? driverLicense;
  String? phone;

  DriverRegistrationFuncionality(
      {required this.context,
      this.names,
      this.lastName,
      this.secondLastName,
      this.driverCI,
      this.driverLicense,
      this.phone});

  onPressedbtnRegisterDriver() {
    Fluttertoast.showToast(
        msg: names!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  onPressedbtnCancelRegisterDriver() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DriversList()));
  }
}
