import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController valueController = TextEditingController();
  CustomTextField({Key? key, required this.hint}) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Container(
      margin:
          new EdgeInsets.only(top: 7.0, bottom: 7.0, left: 40.0, right: 40.0),
      width: width,
      child: new TextField(
          controller: valueController,
          decoration: InputDecoration(
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
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
