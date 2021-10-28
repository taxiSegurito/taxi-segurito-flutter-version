import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/services/CompanyService.dart';

class ScreensCompanyFunctionality {
  Company? company = new Company();
  BuildContext? context;
  VoidCallback? activeShowDialog;

  ScreensCompanyFunctionality(
      {this.activeShowDialog, this.company, this.context});

  onPressedBtnRegister() async {
    insert(company!).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnUpdate() async {
    update(company!).then((value) {
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
