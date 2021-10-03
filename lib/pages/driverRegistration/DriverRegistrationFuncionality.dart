import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverRegistrationFuncionality {
  String names;
  String lastName;
  String secondLastName;
  String driverCI;
  String driverLicense;
  String phone;

  DriverRegistrationFuncionality(this.names, this.lastName, this.secondLastName,
      this.driverCI, this.driverLicense, this.phone);

  onPressedbtnRegisterDriver() {
    Fluttertoast.showToast(
        msg: names,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  onPressedbtnCancelRegisterDriver() {}
}
