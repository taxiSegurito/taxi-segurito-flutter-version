import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/InsertOwner.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/models/Company.dart';

class RegisterOwnerFunctionality {
  BuildContext context;
//person
//user
//owner
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

  List<Company> companyList = [
    Company(companyName: "6 de Agosto", nit: "12345678", idCompany: "1"),
  ];

  List<Company> getListCompany() {
    return companyList.toList();
  }

  onPressedbtnRegisterCar() {
    fullName = names! + " " + lastName! + " " + lastNameSecond!;
    insert(Owner(
            fullName: fullName!,
            cellPhone: cellphone!,
            email: email!,
            password: password!,
            address: address!,
            ci: ci!,
            idCompany: company!.idCompany.toString()))
        .then((_) => activeShowDialog!());
  }

  onPressedUpdate(Owner owner) {}

  closeNavigator() {
    Navigator.of(context).pop();
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }
}
