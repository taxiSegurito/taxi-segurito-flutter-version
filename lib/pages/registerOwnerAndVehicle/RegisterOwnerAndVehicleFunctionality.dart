import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterOwnerAndVehicleFunctionality {
  BuildContext context;

  //atributos de la clase registro
  String nameUser;
  String dni;
  String ownerNationality;
  String phone;
  String model;
  String numberPlate;
  String carColor;
  String capacity;

  RegisterOwnerAndVehicleFunctionality(
      this.context,
      this.nameUser,
      this.dni,
      this.ownerNationality,
      this.phone,
      this.model,
      this.numberPlate,
      this.carColor,
      this.capacity);

  onPressedbtnRegisterCar() {
    agregarUsuario();
    Fluttertoast.showToast(
        msg: dni,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  onPressedbtnCancelRegisterCar() {}

  void agregarUsuario() {
    var url = "http://192.168.1.9/pruebas/agregardueño.php";
    http.post(Uri.parse(url), body: {
      "fullName": nameUser,
      "carnet": dni,
      "nacionality": ownerNationality,
      "phoneNumber": phone,
      "model": model,
      "plaqueNumber": numberPlate,
      "color": carColor,
      "capacity": capacity
    });
  }
}
