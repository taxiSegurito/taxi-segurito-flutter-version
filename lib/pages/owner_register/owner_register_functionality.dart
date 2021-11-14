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

  onPressedbtnRegisterCar() async {
    owner!.idCompany = company!.idCompany;
    final success = await _ownerService.insert(owner!);
    if (success) {
      activeShowDialog!();
    }
  }

  Future<List<Company>?> getCompanies() async {
    companyList.clear();
    try {
      companyList = await _companyService.selectCompany();
      return companyList;
    } catch (exception) {
      return null;
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
