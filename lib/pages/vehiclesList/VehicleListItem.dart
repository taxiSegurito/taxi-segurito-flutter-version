import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/vehicle_info_page.dart';

class VehicleListItem extends StatelessWidget {
  final Vehicle vehicle;
  VehicleListItem(this.vehicle);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => VehicleInfoPage(vehicle))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            children: <Widget>[
              Image(
                height: 70,
                width: width,
                fit: BoxFit.cover,
                image: Image.memory(vehicle.picture).image,
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: ListTile(
                  title: Text(
                    vehicle.pleik,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    vehicle.model,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
