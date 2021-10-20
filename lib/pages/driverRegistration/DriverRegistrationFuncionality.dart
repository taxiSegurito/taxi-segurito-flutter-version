import 'package:flutter/material.dart';

class DriverRegistrationFuncionality {
  BuildContext context;
  String? names;
  String? lastName;
  String? secondLastName;
  String? driverCI;
  String? driverLicense;
  String? phone;
  Image? imageDriver;
  VoidCallback? activeShowDialog;

  DriverRegistrationFuncionality(
      {required this.context,
      this.names,
      this.lastName,
      this.secondLastName,
      this.driverCI,
      this.driverLicense,
      this.phone,
      this.imageDriver,
      this.activeShowDialog});

  onPressedbtnRegisterDriver() async {
    /**
     * todo: Implement driver data log
     */
  }

  onPressedbtnCancelRegisterDriver() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }
}
