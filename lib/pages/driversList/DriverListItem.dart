import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/pages/driverInfo/driverInfoPage.dart';

class DriverListItem extends StatelessWidget {
  final Driver driver;
  DriverListItem(this.driver);

  final _infoStyle = TextStyle(color: Colors.black54);
  void goToDriverInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DriverInfoPage(driver)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToDriverInfo(context),
      child: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
          color: Color(0xFFF6F6F6),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      driver.fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text("CI: ${driver.dni}", style: _infoStyle),
                  Text(driver.cellphone, style: _infoStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
