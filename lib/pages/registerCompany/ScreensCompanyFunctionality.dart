import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/services/CompanyService.dart';

class ScreensCompanyFunctionality {
  Company? company = new Company();
  BuildContext? context;
  VoidCallback? activeShowDialog;

  ScreensCompanyFunctionality(
      {this.activeShowDialog, this.company, this.context});

  onPressedBtnRegister() async {
    Company companyModel = company!;
    insert(companyModel).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  onPressedBtnUpdate() async {
    Company companyModel = company!;
    update(companyModel).then((value) {
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
