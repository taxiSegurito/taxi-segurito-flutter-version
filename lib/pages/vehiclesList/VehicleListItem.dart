import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';

class VehicleListItem extends StatelessWidget {
  final Vehicle vehicle;
  VehicleListItem(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsPage(vehicle))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            children: <Widget>[
              Image(
                image: Image.memory(vehicle.picture).image,
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: ListTile(
                  title: Text(vehicle.pleik),
                  subtitle: Text("${vehicle.model}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
