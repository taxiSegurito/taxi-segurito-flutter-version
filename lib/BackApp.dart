import 'package:flutter/material.dart';

class BackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: [
        new SolidColorBack(),
        new Positioned(
            bottom: 0.0,
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              color: Colors.white,
            ))
      ],
    );
  }
}

class SolidColorBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(decoration: new BoxDecoration(color: Colors.white));
  }
}
