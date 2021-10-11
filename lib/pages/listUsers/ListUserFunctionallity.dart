import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/services/UserDataService.dart';

import 'models/UserData.dart';

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

  onPressedItemListView(Owner userData) {
    Fluttertoast.showToast(
        msg: userData.fullName,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  onPressedReturn() {
    Navigator.pop(context!);
  }
}
