import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';

class DriverData extends StatelessWidget {
  Driver driver;
  DriverData(this.driver);

  @override
  Widget build(BuildContext context) {
    Image imagedefault = new Image.memory(driver.picture);
    double sizeFontSubtitle = 17;
    double width = MediaQuery.of(context).size.width / 3.5;
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
            height: width,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: imagedefault.image, fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Conductor",
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
              driver.fullName,
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
