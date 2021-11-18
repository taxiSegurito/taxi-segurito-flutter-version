import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';

class VehiclePicture extends StatelessWidget {
  Vehicle vehicle;
  VehiclePicture(this.vehicle);

  @override
  Widget build(BuildContext context) {
    Image imagedefault = new Image.memory(vehicle.picture);
    double sizeFontSubtitle = 17;
    double width = MediaQuery.of(context).size.width / 1.5;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: width,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image:
                  DecorationImage(image: imagedefault.image, fit: BoxFit.cover),
              shape: BoxShape.rectangle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vehiculo",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: sizeFontSubtitle,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              vehicle.pleik,
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
