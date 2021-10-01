import 'package:taxi_segurito_app/bloc/services/authService.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/models/sesion.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:flutter/material.dart';

class LoginFuctionality {
  void loginValidate(User user) async {
    Sessions sessions = new Sessions();
    List<dynamic> result = await login(user);
    if (result.length != 0) {
      GlobalToast.displayToast(
          Text("Bienvenido"), Colors.greenAccent, Icon(Icons.check), 2);
      for (var item in result) {
        await sessions.addSessionValue("iduser", item["iduser"].toString());
        await sessions.addSessionValue("rol", item["name"].toString());
      }
      var msg = await sessions.getSessionValue("iduser");
      var role = await sessions.getSessionValue("rol");
      print(msg.toString() + " " + role.toString());
    } else {
      GlobalToast.displayToast(
          Text("Datos Incorrectos"), Colors.redAccent, Icon(Icons.error), 2);
    }
  }
}
