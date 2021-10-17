import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithIcon.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/icons/SocialMediaIcons.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindowFunctionality.dart';

void main() {
  //
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainWindow());
}

class MainWindow extends StatefulWidget {
  MainWindow({Key? key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  bool initialized = false; //
  bool error = false; //
  void InitializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        error = true;
      });
    }
  }

  @override
  void initState() {
    InitializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainWindowFunctionality mainWindowFunctionality =
        new MainWindowFunctionality(context);

    Image logo = new Image.asset(
      "assets/images/logoPrincipal.png",
      height: 150,
      width: 150,
    );

    //Este texto es para el encabezado de la pagina en donde se mostrara el titulo
    Text header = new Text(
        "Conoce nuestra propuesta de movilidad segura en Cochabamba",
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600,
            fontFamily: "Raleway",
            fontStyle: FontStyle.normal,
            fontSize: 24.0),
        textAlign: TextAlign.center);

    //Este boton sirve para llamar al metodo Iniciar sesion con el correo o tu numero de celular
    CustomButton btnIniciarSesionCorreoCelular = new CustomButton(
      onTap: () {
        mainWindowFunctionality.onPressedbtnIniciarSesionCorreoCelular();
      },
      buttonText: "Iniciar sesión con correo / número de celular",
      buttonColor: Colors.white,
      buttonTextColor: Colors.black,
    );

    //Este boton sirve para llamar al metodo Iniciar sesion con cuenta de google
    CustomButtonWithIcon btnInicioSesionGoogle = new CustomButtonWithIcon(
        onTap: () {
          mainWindowFunctionality.onPressedbtnIniciarSesionGoogle();
        },
        contenidoBoton: "Iniciar sesión con Google",
        icon: Icon(
          SocialMediaIcons.google,
          color: Colors.black,
        ));

    //Este boton sirve para llamar al metodo Iniciar sesion con cuenta de Facebook
    CustomButtonWithIcon btnInicioSesionFacebook = new CustomButtonWithIcon(
        onTap: () {
          mainWindowFunctionality.onPressedbtnIniciarSesionFacebook();
        },
        contenidoBoton: "Iniciar sesión con Facebook",
        icon: Icon(
          SocialMediaIcons.facebook,
          color: Colors.black,
        ));

    //Este boton sirve para ingresar a la aplicacion escaneando tu Q
    CustomButton btnSinSesion = new CustomButton(
      onTap: () {
        mainWindowFunctionality.onPressedbtnIniciarSinSesion();
      },
      buttonText: "Escanear QR sin iniciar sesión",
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
    );

    //Este RichText sirve para poder ingresar al apartado de crearte una cuenta
    RichText rtCreateAccount = new RichText(
        text: TextSpan(
      children: [
        TextSpan(
            style: TextStyle(color: Colors.blue),
            text: "Crear una cuenta nueva",
            recognizer: TapGestureRecognizer()..onTap = () {})
      ],
    ));

    TextButton btnCreateAccount = new TextButton(
        onPressed: () {
          mainWindowFunctionality.onPressedrtCrearCuenta();
        },
        child: Text(
          "Crear una cuenta nueva",
          style: TextStyle(color: Colors.blue),
        ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: new EdgeInsets.only(top: 20.0, left: 57, right: 57),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [logo, header]),
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
                        btnCreateAccount,
                      ]),
                )),
          )
        ],
      ),
    );
  }
}
