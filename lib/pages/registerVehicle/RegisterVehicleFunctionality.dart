import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterVehicleFunctionality {
  BuildContext context;

  String? model;
  String? plate;
  String? colorCar;
  String? capacity;
  String? idConductor;
  VoidCallback? activeShowDialog;

  RegisterVehicleFunctionality(
      {required this.context,
      this.model,
      this.plate,
      this.idConductor,
      this.colorCar,
      this.capacity,
      this.activeShowDialog});

  closeNavigator() {
    Navigator.of(context).pop();
  }

  onPressedbtnRegisterCar() {
    agregarUsuario();
    Fluttertoast.showToast(
        msg: model!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    activeShowDialog!();
  }

  onPressedbtnCancelRegisterCar() {}

  void agregarUsuario() {
    /*var url = "http://192.168.1.9/pruebas/agregardueño.php";
    http.post(Uri.parse(url), body: {
      "fullName": nameUser,
      "carnet": dni,
      "nacionality": ownerNationality,
      "phoneNumber": phone,
      "model": model,
      "plaqueNumber": numberPlate,
      "color": carColor,
      "capacity": capacity
    });*/
  }
}
