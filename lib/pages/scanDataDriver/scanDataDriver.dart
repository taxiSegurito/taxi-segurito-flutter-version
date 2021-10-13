//ventana datos del conductor despues de leer el qr
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/personalDataDriver/personalDataDriver.dart';

void main() => runApp(scanDataDriver());

class scanDataDriver extends StatelessWidget {
  const scanDataDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Datos Conductor",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Datos Conductor'),
        backgroundColor: Color.fromRGBO(242, 213, 60, 1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Hola"),
              accountEmail: Text("7000546"),
              currentAccountPicture: CircleAvatar(
                radius: 15,
                backgroundImage:
                    AssetImage("lib/components/assets/images/user.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
