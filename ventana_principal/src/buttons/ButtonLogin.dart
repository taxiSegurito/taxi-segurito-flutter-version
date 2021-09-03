import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonLogin extends StatelessWidget {
  String textoButton = "";
  Color color = Colors.white;
  Color textColor = Colors.black;

  ButtonLogin(String text, Color color, Color textColor) {
    this.textoButton = text;
    this.color = color;
    this.textColor = textColor;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
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
          color: color,
        ),

        child: new Center(
          child: new Text(
            textoButton.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
