import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterOwnerFunctionality {
  BuildContext context;

  var listCompany = {"Taxi Ecoged", "Taxi segurito", "Sin Empresa"};
  String? nameCompany;
  String? names;
  String? lastName;
  String? lastNameSecond;
  String? phone;
  String? email;
  String? password;
  String? dni;
  String? address;
  VoidCallback? activeShowDialog;

  RegisterOwnerFunctionality(
      {required this.context,
      this.nameCompany,
      this.names,
      this.lastName,
      this.lastNameSecond,
      this.email,
      this.password,
      this.address,
      this.dni,
      this.phone,
      this.activeShowDialog});

  List getListCompany() {
    return listCompany.toList();
  }

  onPressedbtnRegisterCar() {
    agregarUsuario();
    Fluttertoast.showToast(
        msg: nameCompany!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    activeShowDialog!();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }

  onPressedbtnCancelRegisterCar() {}

  void agregarUsuario() {
    /*var url = "http://192.168.1.9/pruebas/agregardueño.php";
    http.post(Uri.parse(url), body: {
      "fullName": names,
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
