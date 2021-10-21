import 'package:flutter/material.dart';

class VehicleListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
            ),
            Container(
              padding: EdgeInsets.only(top: 6),
              child: ListTile(
                title: Text('Titulo'),
                subtitle: Text(
                    'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
