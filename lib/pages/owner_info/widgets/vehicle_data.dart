import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';

class VehicleData extends StatelessWidget {
  final Vehicle vehicle;
  VehicleData(this.vehicle);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Image imageDefault = Image.memory(vehicle.picture);

    final vehicleData = Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: Text(
              vehicle.model,
              style: TextStyle(fontSize: 19),
            ),
            subtitle: Text(
              vehicle.pleik,
              style: TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );

    final vehicleImage = new Container(
      height: 70,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: imageDefault.image, fit: BoxFit.cover),
          shape: BoxShape.rectangle),
    );

    return Container(
      width: width,
      margin: EdgeInsets.only(left: 35, right: 35),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 0, child: vehicleImage),
              Expanded(flex: 1, child: vehicleData),
            ],
          ),
        ],
      ),
    );
  }
}
