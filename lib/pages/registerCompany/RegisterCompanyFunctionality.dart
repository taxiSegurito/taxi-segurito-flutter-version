import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/services/CompanyService.dart';

class RegisterCompanyFunctionality {
  Company? company;
  BuildContext context;
  String? idCompany;
  String? nameCompany;
  String? nit;
  VoidCallback? activeShowDialog;

  RegisterCompanyFunctionality(
      {this.nameCompany,
      this.activeShowDialog,
      this.nit,
      this.idCompany,
      required this.context});

  onPressedBtnRegister() async {
    company = new Company(companyName: nameCompany!, nit: nit!);
    insert(company!).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnUpdate() async {
    company =
        new Company(companyName: nameCompany!, nit: nit!, idCompany: idCompany);
    update(company!).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnCancel() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context).pop();
  }
}
