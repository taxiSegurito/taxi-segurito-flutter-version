import 'dart:developer';

import 'package:flutter_qr_bar_scanner/flutter_qr_bar_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';
import 'package:taxi_segurito_app/utils/login_facebook_utils.dart';
import 'package:taxi_segurito_app/utils/login_google_utils.dart';
import 'package:flutter/material.dart';

var showToast = Fluttertoast.showToast(
    msg: "Hubo Un Error Al Iniciar",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.yellow);

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
    try {
      LoginGoogleUtils().signUpWithGoogle().then((user) {
        if (user != null) {
          if (user.cellphone != "null") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => QRPAGE()),
            ); //Ruta a Cambiar
          } else {
            //Se deberia llamar a la ventana de registro telefono
            //para llenar el dato y llamar al metodo AddDataGoogle(client)
            log("no hay numero");
          }
        } else {
          showToast;
        }
      });
    } catch (e) {
      showToast;
    }
  }

  //evento click del boton de inicio sesion con facebook
  onPressedbtnIniciarSesionFacebook() {
    Fluttertoast.showToast(
        msg: "Iniciar sesion facebook",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    try {
      LoginFacebookUtils().LoginWithFacebook().then((user) {
        if (user != null) {
          if (user.cellphone != "") {
            Navigator.pushNamed(context, 'scannerQr'); //Ruta a Cambiar
          } else {
            //Se deberia llamar a la ventana de registro telefono
            //para llenar el dato y llamar al metodo AddDataFacebook(client)
          }
        } else {
          showToast;
        }
      });
    } catch (e) {
      showToast;
    }
  }

  //evento click del boton de inicio sin sesion o escanear QR
  onPressedbtnIniciarSinSesion() {
    Fluttertoast.showToast(
        msg: "Iniciar Lector QR",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    Navigator.pushReplacement(
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
