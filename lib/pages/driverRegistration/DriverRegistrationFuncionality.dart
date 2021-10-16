import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/bloc/services/driverService.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/services/InsertCompany.dart';

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

  register(Driver driverModel) async {
    await DriverService().addDriver(driverModel).then((success) {
      Fluttertoast.showToast(
          msg: "Resistro conductor EXITOSO",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    });
  }

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
        name: names! + " " + lastName! + " " + secondLastName!,
        phone: phone!,
        licence: driverLicense!,
        dni: driverCI!,
        photo: imageDriver!,
        idowner: int.parse(idowner.toString()));
    register(driverModel);
  }

  onPressedbtnCancelRegisterDriver() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }
}
