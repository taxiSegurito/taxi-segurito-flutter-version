import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/menu/menuItem.dart';
import 'package:taxi_segurito_app/utils/admin_session.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

abstract class Menu extends StatelessWidget {
  final Sessions sessions = new Sessions();
  late String name = "";

  Menu.initial();
  Menu(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () async {
              AdminSession().deleteSession().then((value) {
                if (value == true) {
                  Navigator.pushReplacementNamed(context, 'firstScreen');
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bienvenido,\n${this.name}",
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
