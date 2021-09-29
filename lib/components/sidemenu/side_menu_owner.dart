import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuOwner extends StatelessWidget {
  const SideMenuOwner({
    Key? key,
  }) : super(key: key);

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
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10, 100, 140, 0),
              decoration: BoxDecoration(
                color: Colors.amber[300],
              ),
              child: Column(
                children: [
                  Text(
                    "Nombre Dueño",
                    style: TextStyle(fontSize: 20, fontFamily: "Raleway"),
                  ),
                  Text(
                    "+591 69435838",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: "Raleway",
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista choferes'),
            ),
            divider,
          ],
        ),
      ),
    );
  }
}
