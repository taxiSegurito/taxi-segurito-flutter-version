import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/menu/menuItem.dart';

abstract class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bienvenido,\nDaniel",
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
              padding: EdgeInsets.only(left: 24, right: 24),
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                children: getItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<MenuItem> getItems();
}
