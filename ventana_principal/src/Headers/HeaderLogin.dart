import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/BackApp.dart';
//import 'package:pagina_principal/BackApp.dart';

import 'package:url_launcher/url_launcher.dart';

import '../buttons/ButtonLogin.dart';

class Header extends StatelessWidget {
  var defaultText = TextStyle(color: Colors.black);
  var linkText = TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final button = new InkWell(
      child: new Container(
        margin: new EdgeInsets.only(top: 30.0, left: 40.0, right: 40),
        height: 50.0,
        //width: 180.0,

        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Colors.grey,
                offset: new Offset(0.5, 0.5),
                blurRadius: 10.0)
          ],
          borderRadius: new BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: new Center(
            child: new Text(
          "Iniciar sesión con correo / número de celular",
          style: const TextStyle(color: Colors.black),
        )),
      ),
    );

    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new BackApp(),
          new Container(
            alignment: Alignment.center,
            margin: new EdgeInsets.only(top: 50.0),
            child: new Column(
              children: <Widget>[
                /* Image.asset("ventana_principal/assets/images/logoPrincipal.png",
                    height: 100, width: 100),*/
                new Text(
                  "Conoce nuestra propuesta\n   de movilidad segura en\n            cochabamba",
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                new ButtonLogin("Iniciar sesión con correo / número de celular",
                    Colors.white, Colors.black),
                new ButtonLogin(
                    "Iniciar sesión con Google", Colors.white, Colors.black),
                new ButtonLogin(
                    "Iniciar sesión con Facebook", Colors.white, Colors.black),
                new Text(
                  "\nó",
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new ButtonLogin("Escanear QR sin iniciar sesión",
                    Color.fromRGBO(245, 188, 49, 1), Colors.white),
                new Text(
                  "\n¿Aún no tienes una cuenta?",
                  style: const TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          style: linkText,
                          text: "Crear una cuenta nueva",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              var url =
                                  "https://www.youtube.com/watch?v=urnrIW-eaX4";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw "Cannot";
                              }
                            })
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
