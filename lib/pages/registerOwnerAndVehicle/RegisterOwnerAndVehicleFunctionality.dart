import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    Fluttertoast.showToast(
        msg: dni,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  onPressedbtnCancelRegisterCar() {}
}
