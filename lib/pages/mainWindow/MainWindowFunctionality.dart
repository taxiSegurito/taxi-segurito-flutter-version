import 'package:flutter_qr_bar_scanner/flutter_qr_bar_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';

import 'MainWindow.dart';
import 'package:flutter/material.dart';

class MainWindowFunctionality {
  BuildContext context;

  MainWindowFunctionality(this.context);

  onPressedbtnIniciarSesionCorreoCelular() {
    _navigateAndDisplaySelection(context);
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.pushNamed(context, 'loginUser');
    Fluttertoast.showToast(
        msg: result.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
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
        msg: "Iniciar sesion facebook",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  //evento click del boton de inicio sin sesion o escanear QR
  onPressedbtnIniciarSinSesion() {
    Fluttertoast.showToast(
        msg: "Iniciar Lector QR",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRPAGE()),
    );
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
