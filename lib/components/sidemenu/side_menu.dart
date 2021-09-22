import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //variable utilizada para separar ListTile
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
              leading: Icon(Icons.contact_page_rounded),
              title: Text('Contactos de Emergencia'),
            ),
            divider,
            ListTile(
              tileColor: Colors.red.shade100,
              leading: Icon(
                Icons.warning_rounded,
                color: Colors.red,
              ),
              title: Text(
                'Boton de Panico',
                style: TextStyle(color: Colors.red),
              ),
            ),
            divider,
          ],
        ),
      ),
    );
  }
}
