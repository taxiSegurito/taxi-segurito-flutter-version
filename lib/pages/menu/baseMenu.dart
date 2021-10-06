import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/SquareButtonWithIcon.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bienvenido(a),\nAlejandra",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  SquareButtonWithIcon(),
                  SquareButtonWithIcon(),
                  SquareButtonWithIcon(),
                  SquareButtonWithIcon(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
