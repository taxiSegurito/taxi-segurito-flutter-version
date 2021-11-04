import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';

class VehicleListItem extends StatelessWidget {
  final Vehicle vehicle;
  VehicleListItem(this.vehicle);

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
                  'https://upload.wikimedia.org/wikipedia/commons/f/fd/Taxi_en_Madrid.jpg'),
            ),
            Container(
              padding: EdgeInsets.only(top: 6),
              child: ListTile(
                title: Text(vehicle.pleik),
                subtitle: Text("${vehicle.model}\n\nNombre conductor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
