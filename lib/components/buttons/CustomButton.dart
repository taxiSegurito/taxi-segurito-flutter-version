import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTextColor})
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
            Text(buttonText,
                style: TextStyle(
                    color: buttonTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.center),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: Size(300, 100),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
