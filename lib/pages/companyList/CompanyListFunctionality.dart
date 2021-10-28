import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/services/CompanyService.dart';
import 'package:taxi_segurito_app/services/OwnerService.dart';

List<Company> listCompany = [
  Company(companyName: "Taxis del norte", nit: "123456", idCompany: "1"),
  Company(companyName: "Taxis del norte", nit: "123456", idCompany: "1"),
  Company(companyName: "Taxis del norte", nit: "123456", idCompany: "1")
];

class CompanyListFunctionallity {
  BuildContext? context;
  VoidCallback? callUpdateListView;

  CompanyListFunctionallity({this.context, this.callUpdateListView});

  set setVoidCallbackUpdateListView(VoidCallback voidCallback) {
    this.callUpdateListView = voidCallback;
  }

  set setContext(BuildContext context) {
    this.context = context;
  }

/*El metodo loaded se ejecuta cuando la pantalla se carga con todos
 * los widgets es activado por el metodo initState de la Clase ListUser.dart 
 */
  loaded() {
    loadListView();
  }

  loadListView() {
    selectCompanyDataBase();
  }

  selectCompanyDataBase() {
    listCompany = [];
    try {
      selectCompany().then((value) {
        listCompany = value;
        callUpdateListView!();
      });
    } catch (exception) {
      print(exception);
    }
  }

  selectLikeCompanyDataBase(String value) {
    try {
      selectCompanyByLike(value).then((value) {
        listCompany = value;
        callUpdateListView!();
      });
    } catch (exception) {
      print(exception);
    }
  }

  onPressedSearhCompany(String value) {
    selectLikeCompanyDataBase(value);
  }

  onPressedReloadListView() {
    loadListView();
  }

  /* este metodo se ejecuta cuando se presion un item del list view
  */
  onPressedItemListView(Owner userData) {
    print("functionality" + userData.fullName);
  }

  onPressedReturn() {
    Navigator.pop(context!);
  }
}
