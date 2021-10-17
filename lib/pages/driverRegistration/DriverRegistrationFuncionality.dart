import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/services/InsertCompany.dart';
import 'package:taxi_segurito_app/services/insertDriver.dart';

class DriverRegistrationFuncionality {
  BuildContext context;
  String? names;
  String? lastName;
  String? secondLastName;
  String? driverCI;
  String? driverLicense;
  String? phone;
  String? imageDriver;
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

    print(imageDriver);
    Sessions idsesion = new Sessions();
    var idowner = await idsesion.getSessionValue("iduser");
    Driver driverModel = Driver.insert(
        names! + " " + lastName! + " " + secondLastName!,
        phone!,
        driverLicense!,
        driverCI!,
        imageDriver!,
        int.parse(idowner.toString()));
    insertDriver(driverModel);
  }

  onPressedbtnCancelRegisterDriver() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }
}
