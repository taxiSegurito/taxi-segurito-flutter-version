import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompany.dart';
import 'package:taxi_segurito_app/services/OwnerService.dart';

List<Owner> listUserData = [];

class ListUserFunctionallity {
  BuildContext? context;
  VoidCallback? callUpdateListView;

  ListUserFunctionallity({this.context, this.callUpdateListView});

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
    selectUserDataDataBase();
  }

  selectUserDataDataBase() {
    listUserData = [];
    try {
      select().then((value) {
        listUserData = value;
        callUpdateListView!();
      });
    } catch (exception) {
      print(exception);
    }
  }

  selectLikeUserDataDataBase(String value) {
    try {
      selectByLike(value).then((value) {
        listUserData = value;
        callUpdateListView!();
      });
    } catch (exception) {
      print(exception);
    }
  }

  onPressedSearhUserData(String value) {
    selectLikeUserDataDataBase(value);
  }

  onPressedReloadListView() {
    loadListView();
  }

  /* este metodo se ejecuta cuando se presion un item del list view
  */
  onPressedItemListView(Owner userData) {
    print("functionality" + userData.fullName);
    Company company =
        Company(companyName: "6 de Agosto", nit: "123123", idCompany: "1");
    Navigator.push(
      context!,
      new MaterialPageRoute(
        builder: (BuildContext context) =>
            new RegisterCompany.fromRegisterCompany(
          company: company,
        ),
      ),
    );
  }

  onPressedReturn() {
    Navigator.pop(context!);
  }
}
