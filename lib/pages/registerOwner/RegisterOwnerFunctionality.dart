import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/Company.dart';

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

  List<Company> listDriver = [
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 1),
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 2),
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 3),
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 4),
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 5),
    Company(nameCopany: "6 de Agosto", nit: "12345678", idCompani: 6),
  ];

  List<Company> getListCompany() {
    return listDriver.toList();
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

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }

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
