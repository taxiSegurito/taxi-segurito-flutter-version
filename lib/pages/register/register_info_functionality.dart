import 'dart:math';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/bloc/implementation/userimpl.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';

class RegisterFunctionality {
  late BuildContext context;

  RegisterFunctionality();
  RegisterFunctionality.cont(this.context);

  String generateCode() {
    String code = "";
    var rng = new Random();
    for (var i = 0; i < 6; i++) {
      code = code + rng.nextInt(9).toString();
    }
    return code;
  }

  registerClient(Clientuser clientuser) async {
    final result = await insertClient(clientuser);
    if (result) {
      GlobalToast.displayToast(
          Text("Registro Exitoso"), Colors.green, Icon(Icons.check), 2);
      Navigator.pushNamed(context, 'loginUser');
    } else {
      GlobalToast.displayToast(
          Text("Registro no completado"), Colors.red, Icon(Icons.error), 2);
    }
  }
}
