import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/menu/menuItem.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';

abstract class Menu extends StatelessWidget {
  final AuthService _authService = AuthService();
  late String? name;

  Menu({this.name});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      name = ModalRoute.of(context)!.settings.arguments as String;
    }

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
              final success = await _authService.logOut();
              if (success) {
                Navigator.pushReplacementNamed(context, 'firstScreen');
              }
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
                  "Bienvenido,\n$name",
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
