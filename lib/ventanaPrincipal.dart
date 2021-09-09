import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/componentes/buttons/ButtonLoginIcon.dart';
import 'package:taxi_segurito_app/componentes/buttons/buttonLogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/componentes/my_flutter_app_icons.dart';

//import 'package:componentes/buttons/ButtonLogin.dart';

class VentanaPrincipal extends StatefulWidget {
  VentanaPrincipal({Key? key}) : super(key: key);

  @override
  _VentanaPrincipalState createState() => _VentanaPrincipalState();
}

class _VentanaPrincipalState extends State<VentanaPrincipal> {
  @override
  Widget build(BuildContext context) {
    Image logo = new Image.asset(
      "lib/componentes/assets/images/logoPrincipal2.png",
      height: 150,
      width: 150,
    );

    //Este texto es para el encabezado de la pagina en donde se mostrara el titulo
    Text encabezado = new Text(
        "Conoce nuestra propuesta de movilidad segura en Cochabamba",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600,
            fontFamily: "Raleway",
            fontStyle: FontStyle.normal,
            fontSize: 24.0),
        textAlign: TextAlign.center);

    //Este boton sirve para llamar al metodo Iniciar sesion con el correo o tu numero de celular
    ButtonLogins btnIniciarSesionCorreoCelular = new ButtonLogins(
      onTap: onPressedbtnIniciarSesionCorreoCelular,
      contenidoBoton: "Iniciar sesión con correo / número de celular",
      colorBoton: Colors.white,
      colorTextoBoton: Colors.black,
    );

    //Este boton sirve para llamar al metodo Iniciar sesion con cuenta de google
    ButtonLoginsIcon btnInicioSesionGoogle = new ButtonLoginsIcon(
        onTap: onPressedbtnIniciarSesionGoogle,
        contenidoButton: "Iniciar sesión con Google",
        icon: Icon(
          MyFlutterApp.google,
          color: Colors.black,
        ));

    //Este boton sirve para llamar al metodo Iniciar sesion con cuenta de Facebook
    ButtonLoginsIcon btnInicioSesionFacebook = new ButtonLoginsIcon(
        onTap: onPressedbtnIniciarSesionCorreoCelular,
        contenidoButton: "Iniciar sesión con Facebook",
        icon: Icon(
          MyFlutterApp.facebook,
          color: Colors.black,
        ));

    //Este boton sirve para ingresar a la aplicacion escaneando tu Q
    ButtonLogins btnSinSesion = new ButtonLogins(
      onTap: onPressedbtnIniciarSesionGoogle,
      contenidoBoton: "Escanear QR sin iniciar sesión",
      colorBoton: Color.fromRGBO(255, 193, 7, 1),
      colorTextoBoton: Colors.white,
    );

    //Este RichText sirve para poder ingresar al apartado de crearte una cuenta
    RichText rtCrearCuenta = new RichText(
        text: TextSpan(
      children: [
        TextSpan(
            style: TextStyle(color: Colors.blue),
            text: "Crear una cuenta nueva",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onPressedrtCrearCuenta();
              })
      ],
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //reciven hijos como arreglos
        //las columnas toman el ancho de la pantalla y tambien el alto
        mainAxisAlignment: MainAxisAlignment.center, //mide la pantalla
        mainAxisSize: MainAxisSize.max, //mide lo minimo posible
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: new EdgeInsets.only(top: 20.0, left: 57, right: 57),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [logo, encabezado]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                margin: new EdgeInsets.only(
                  top: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    btnIniciarSesionCorreoCelular,
                    btnInicioSesionGoogle,
                    btnInicioSesionFacebook,
                    new Container(
                      //color: Colors.green,
                      alignment: Alignment.center,
                      margin: new EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 35.0, right: 35.0),
                      child: new Text(
                        "ó",
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    btnSinSesion
                  ],
                )),
          ),
          Expanded(
            flex: 0,
            child: Container(
                height: 80,
                child: new Container(
                  margin: new EdgeInsets.only(bottom: 10.0),
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("¿Aún no tienes una cuenta?",
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Raleway",
                                fontStyle: FontStyle.normal,
                                fontSize: 15),
                            textAlign: TextAlign.center),
                        rtCrearCuenta,
                      ]),
                )),
          )
        ],
      ),
    );
  }

  //evento click del boton de inicio sesion correo/numero
  onPressedbtnIniciarSesionCorreoCelular() {
    Fluttertoast.showToast(
        msg: "Inciar sesion correo celular",
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
