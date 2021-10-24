import 'dart:async';
import 'dart:developer';
import 'package:custom_long_tap/custom_long_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/utils/call_panic.dart';
import 'package:taxi_segurito_app/utils/logOut.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/listContact_page.dart';

var showToast = Fluttertoast.showToast(
    msg: "Debes Presionar 5 segundos",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.yellow);

class SideMenu extends StatelessWidget {
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      color: Colors.grey[350],
      height: 5,
      thickness: 1.5,
      indent: 10,
      endIndent: 10,
    );
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber[300],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                          'http://assets.stickpng.com/images/585e4bd7cb11b227491c3397.png'),
                    ),
                  ),
                  Text("Nombre Usuario"),
                  Text(
                    "+591 xxxxxxxxx",
                    style: TextStyle(
                        color: Colors.grey[500], fontFamily: "Raleway"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time_outlined),
              title: Text('Historial De Reseñas'),
            ),
            divider,
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListContact_Page()),
                );
              },
              leading: Icon(Icons.contact_page_rounded),
              title: Text('Contactos de Emergencia'),
            ),
            divider,
            GestureDetector(
              onPanCancel: () => timer.cancel(),
              onPanDown: (_) => {
                timer = Timer(Duration(seconds: 5), () async {
                  // time duration
                  // your function here
                  try {
                    bool controlSms = false, controlCall = false;
                    await CallPanic().SendSms().then((value) => {
                          if (value == true) {controlSms = value}
                        });
                    await CallPanic().Call_Number().then((value) => {
                          if (value == true) {controlCall = value}
                        });
                    if (controlSms == true && controlCall == true) {
                      log("Se Ejecuta");
                      print("Entra Hasta Aqui");
                      showDialog(context: context, builder: alertDialog);
                    } else {
                      log("Hubo Algun Fallo");
                    }
                  } catch (e) {
                    log(e.toString());
                  }
                })
              },
              child: ListTile(
                tileColor: Colors.red.shade100,
                leading: Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                ),
                onTap: () {
                  showToast;
                  log("Debes presionar 5 segundos");
                  showDialog(context: context, builder: infoDialog);
                },
                title: Text(
                  'Boton de Panico',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            divider,
            ListTile(
              tileColor: Colors.red.shade100,
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                'Cerrar Sesion',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                try {
                  LogOut().LogOutSession().then((value) {
                    if (value == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainWindow()),
                      );
                    }
                  });
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog infoDialog(BuildContext context) {
    return AlertDialog(
      title: new Text("Presiona!"),
      content: new Text("Presiona 5 segundos por favor."),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FloatingActionButton(
          backgroundColor: Colors.amberAccent,
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.shade50,
      title: new Text("ALERTA PANICO!!"),
      content: new Text("Mesaje de Alerta Enviado Con Exito."),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FloatingActionButton(
          backgroundColor: Colors.amberAccent,
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
