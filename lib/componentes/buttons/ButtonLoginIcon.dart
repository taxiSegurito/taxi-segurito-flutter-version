import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonLoginsIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String contenidoButton;
  final Icon icon;
  const ButtonLoginsIcon(
      {Key? key,
      required this.onTap,
      required this.contenidoButton,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Container(
      margin:
          new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 50.0, right: 50.0),
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          color: Colors.white),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: // Iniciar sesión con correo / número de celular
            Row(
                mainAxisAlignment: MainAxisAlignment.center, //mide la pantalla
                mainAxisSize: MainAxisSize.max,
                children: [
              Container(
                margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: icon,
              ),
              Text(contenidoButton,
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
            ]),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          alignment: Alignment.center,

          fixedSize: Size(300, 100),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //shadowColor: Colors.blue,
        ),
      ),
    );
  }
}
