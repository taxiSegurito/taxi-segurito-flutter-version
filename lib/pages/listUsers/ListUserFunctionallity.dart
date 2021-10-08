import 'package:flutter/cupertino.dart';
import 'package:taxi_segurito_app/services/UserDataService.dart';

import 'models/UserData.dart';

List<UserData> listUserData = [];

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
      selectByLike().then((value) {
        callUpdateListView!();
      });
    } catch (exception) {
      print(exception);
    }
  }

  onPressedSearhUserData(String value) {
    selectLikeUserDataDataBase(value);
  }

  onPressedReturn() {
    Navigator.pop(context!);
  }
}
