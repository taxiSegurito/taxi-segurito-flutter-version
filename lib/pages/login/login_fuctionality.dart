import 'package:taxi_segurito_app/bloc/services/authService.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:flutter/material.dart';

class LoginFuctionality {
  late BuildContext context;

  LoginFuctionality(this.context);

  void loginValidate(User user) async {
    Sessions sessions = new Sessions();
    List<dynamic> result = await login(user);

    if (result.length != 0) {
      /*GlobalToast.displayToast(
          Text("Bienvenido"), Colors.greenAccent, Icon(Icons.check), 2);*/
      for (var item in result) {
        await sessions.addSessionValue("iduser", item["id"].toString());
        await sessions.addSessionValue("rol", item["role"].toString());
        await sessions.addSessionValue("name", item["name"].toString());
      }
      var msg = await sessions.getSessionValue("id");
      var role = await sessions.getSessionValue("role");

      print(
        msg.toString() + " " + role.toString(),
      );

      if (role.toString() == "admin") {
        Navigator.pushNamed(context, 'adminMenu');
      }

      if (role.toString() == "client") {
        Navigator.pushNamed(context, 'QRpage');
      }

      if (role.toString() == "owner") {
        Navigator.pushNamed(context, 'ownerMenu');
      }
    } else {
      GlobalToast.displayToast(
        Text("Datos Incorrectos"),
        Colors.redAccent,
        Icon(Icons.error),
        2,
      );
      print("No se logueo");
    }
  }
}
