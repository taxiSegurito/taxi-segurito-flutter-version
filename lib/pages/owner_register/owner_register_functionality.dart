import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/models/company.dart';
import 'package:taxi_segurito_app/pages/owner_list/owner_list_page.dart';
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

  Future<List<Company>?> getCompanies() async {
    List<Company> companyList = [];
    companyList.clear();
    try {
      companyList = await _companyService.selectCompany();
      return companyList;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  onPressedbtnRegisterCar() async {
    owner!.idCompany = company!.idCompany;
    final success = await _ownerService.insert(owner!);
    if (success) {
      activeShowDialog!();
    }
  }

  onPressedbtnDeleteOwner() {
    try {
      _ownerService.deleteOwner(owner!).then((value) {
        if (value) {
          Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (BuildContext context) => new OwnerListPage(),
            ),
          );
        }
      });
    } catch (exception) {}
  }

  onPressedbtnUpdateOwner() {
    try {
      _ownerService.update(owner!).then(
        (value) {
          if (value) {
            activeShowDialog!();
          }
        },
      );
    } catch (exception) {}
  }

  closeNavigator() {
    Navigator.of(context!).pop();
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }
}
