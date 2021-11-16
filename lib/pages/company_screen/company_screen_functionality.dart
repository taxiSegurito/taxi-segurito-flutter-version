import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/services/company_service.dart';

class CompanyScreenFunctionality {
  Company? company = new Company();
  BuildContext? context;
  VoidCallback? activeShowDialog;
  late CompanyService companyService;

  CompanyScreenFunctionality({
    this.activeShowDialog,
    this.company,
    this.context,
  }) {
    companyService = CompanyService();
  }

  onPressedBtnRegister() async {
    companyService.insert(company!).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnUpdate() async {
    companyService.update(company!).then((value) {
      print(value);
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnCancel() {
    closeNavigator();
  }

  closeNavigator() {
    Navigator.of(context!).pop();
  }
}
