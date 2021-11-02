import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';

List<Owner> listUserData = [];

class OwnerListFunctionallity {
  BuildContext? context;
  VoidCallback? callUpdateListView;

  OwnerListFunctionallity({this.context, this.callUpdateListView});

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
  }

  onPressedReturn() {
    Navigator.pop(context!);
  }
}
