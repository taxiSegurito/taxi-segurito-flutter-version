import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/models/company.dart';
import 'package:taxi_segurito_app/services/company_service.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';

class RegisterOwnerFunctionality {
  BuildContext? context;
//person
//user
//owner
  Company? company;
  Owner? owner;
  VoidCallback? activeShowDialog;

  OwnerService _ownerService = OwnerService();
  CompanyService _companyService = CompanyService();

  RegisterOwnerFunctionality(
      {this.context, this.company, this.owner, this.activeShowDialog});

  List<Company> companyList = [
    Company(companyName: "6 de Agosto", nit: "12345678", idCompany: "1"),
  ];

  List<Company> getListCompany() {
    return companyList.toList();
  }

  onPressedbtnRegisterCar() {
    _ownerService.insert(owner!).then((_) => activeShowDialog!());
  }

  getCompanies() {
    companyList.clear();
    try {
      _companyService.selectCompany().then(
        (value) {
          companyList = value;
        },
      );
    } catch (exception) {
      print(exception);
    }
  }

  onPressedUpdate(Owner owner) {}

  closeNavigator() {
    Navigator.of(context!).pop();
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }
}
