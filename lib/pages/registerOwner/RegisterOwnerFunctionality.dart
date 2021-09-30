import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/insertOwner.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/models/Company.dart';

class RegisterOwnerFunctionality {
  BuildContext context;

  var listCompany = {"Taxi Ecoged", "Taxi segurito", "Sin Empresa"};
  Company? company;
  String? names;
  String? lastName;
  String? lastNameSecond;
  String? fullName;
  String? cellphone;
  String? email;
  String? password;
  String? ci;
  String? address;
  VoidCallback? activeShowDialog;

  RegisterOwnerFunctionality(
      {required this.context,
      this.company,
      this.names,
      this.lastName,
      this.lastNameSecond,
      this.email,
      this.password,
      this.address,
      this.ci,
      this.cellphone,
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
    fullName = names! + " " + lastName! + " " + lastNameSecond!;
    insert(Owner(
        fullname: fullName!,
        cellphone: cellphone!,
        email: email!,
        password: password!,
        address: address!,
        ci: ci!,
        idCompany: company!.idCompani!));
    Fluttertoast.showToast(
        msg: company!.nameCopany,
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
}
