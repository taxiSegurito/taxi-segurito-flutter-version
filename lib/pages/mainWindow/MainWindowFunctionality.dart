import 'package:fluttertoast/fluttertoast.dart';

import 'MainWindow.dart';
import 'package:flutter/material.dart';

class MainWindowFunctionality {
  BuildContext context;

  MainWindowFunctionality(this.context);

  onPressedbtnIniciarSesionCorreoCelular() {
    Navigator.pushNamed(context, 'loginUser');
  }

  //evento click del boton de inicio sesion con google
  onPressedbtnIniciarSesionGoogle() {
    Fluttertoast.showToast(
        msg: "Iniciar sesion google",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  //evento click del boton de inicio sesion con facebook
  onPressedbtnIniciarSesionFacebook() {
    Fluttertoast.showToast(
        msg: "Inisiar sesion facebook",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  //evento click del boton de inicio sin sesion o escanear QR
  onPressedbtnIniciarSinSesion() {
    Fluttertoast.showToast(
        msg: "Iniciar sin sesion",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  //evento click del boton de crear cuenta
  onPressedrtCrearCuenta() {
    Fluttertoast.showToast(
        msg: "Crear Cuenta",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }
}
