import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class DriverData extends StatelessWidget {
  Driver driver;
  DriverData(this.driver);

  @override
  Widget build(BuildContext context) {
    Image imagedefault = new Image.memory(driver.picture);
    double sizeFontSubtitle = 17;
    double width = MediaQuery.of(context).size.width / 3.5;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: width,
            height: width,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: imagedefault.image, fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  "CI:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Raleway",
                    fontSize: sizeFontSubtitle,
                  ),
                ),
              ),
              Text(
                driver.ci,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: sizeFontSubtitle,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                child: Icon(
                  Icons.phone,
                  size: sizeFontSubtitle,
                  color: Color.fromRGBO(207, 207, 207, 1),
                ),
              ),
              Text(
                driver.cellphone,
                style: TextStyle(
                    fontSize: sizeFontSubtitle,
                    fontFamily: "Raleway",
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ],
      ),
    );
  }
}
