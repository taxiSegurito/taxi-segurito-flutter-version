import 'package:flutter/material.dart';

class ButtonPrueba extends StatelessWidget {
  String textoButton = "efwefwef";

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
          color: Colors.white,
        ),
        child: new Center(
            child: new Text(
          textoButton.toString(),
          style: const TextStyle(color: Colors.black),
        )),
      ),
    );
  }
}



/*class Button()
{
  onTap: () {},
  child: Ink(
    color: Color(0xFF397AF3),
    child: Padding(
      padding: EdgeInsets.all(6),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.android),
          SizedBox(width: 12),
          Text('Sign in with Google'),
        ],
      ),
    ),
  ),
}*/

