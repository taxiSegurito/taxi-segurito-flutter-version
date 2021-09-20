import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController valueController = TextEditingController();
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;

  CustomTextField(
      {Key? key,
      required this.hint,
      this.marginLeft = 50,
      this.marginRight = 50,
      this.marginTop = 5,
      this.marginBotton = 5})
      : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Container(
      margin: new EdgeInsets.only(
          top: marginTop,
          bottom: marginBotton,
          left: marginLeft,
          right: marginRight),
      width: width,
      height: 40,
      alignment: Alignment.bottomCenter,
      //color: Colors.red,
      child: new TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: valueController,
          //style: TextStyle(height: 0.5, color: Colors.green),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            fillColor: Colors.yellow,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )),
    );
  }

  String getValue() {
    return valueController.text;
  }
}
