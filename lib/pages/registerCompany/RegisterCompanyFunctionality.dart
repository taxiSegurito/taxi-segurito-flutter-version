import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/services/InsertCompany.dart';

class RegisterCompanyFunctionality {
  Company? company;
  BuildContext context;
  String? nameCompany;
  String? nit;
  VoidCallback? activeShowDialog;

  RegisterCompanyFunctionality(
      {this.nameCompany,
      this.activeShowDialog,
      this.nit,
      required this.context});

  onPressedBtnRegister() {
    company = new Company(nameCopany: nameCompany!, nit: nit!);
    insert(company!).then((_) {
      activeShowDialog!();
    });
  }

  onPressedBtnCancel() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }
}
