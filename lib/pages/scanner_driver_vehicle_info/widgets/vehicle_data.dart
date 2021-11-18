import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';

class VehicleData extends StatelessWidget {
  final Vehicle vehicle;
  VehicleData(this.vehicle);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 8;
    Image imageDefault = Image.memory(vehicle.picture);

    final vehicleIcon = Container(
      alignment: Alignment.centerRight,
      width: width,
      height: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset("assets/icons/iconCar.png").image,
          fit: BoxFit.cover,
        ),
      ),
    );

    final vehicleData = Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _vehicleAttribute(
            "Placa",
            vehicle.pleik,
            fontsize: 24,
            weight: FontWeight.bold,
          ),
          _vehicleAttribute("Modelo", vehicle.model),
          _vehicleAttribute("Color", vehicle.color),
        ],
      ),
    );

    final vehicleImage = new Container(
      height: 130,
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: imageDefault.image, fit: BoxFit.cover),
          shape: BoxShape.rectangle),
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 0, child: vehicleIcon),
                Expanded(flex: 1, child: vehicleData),
              ],
            ),
            vehicleImage
          ],
        ),
      ),
    );
  }

  Widget _vehicleAttribute(
    title,
    value, {
    double fontsize = 15.0,
    FontWeight weight = FontWeight.normal,
  }) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Raleway',
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Raleway',
                  fontSize: fontsize,
                  fontWeight: weight,
                  letterSpacing: 0),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
