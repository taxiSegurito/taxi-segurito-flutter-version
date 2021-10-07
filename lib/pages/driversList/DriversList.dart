import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

import 'DriverListItem.dart';

class DriversList extends StatelessWidget {
  final List<Driver> drivers;

  DriversList(this.drivers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drivers.length,
      itemBuilder: (_, index) {
        return DriverListItem(drivers[index]);
        // Driver("Juan Perez Quiroga", "14789632", "71714906"));
      },
    );
  }
}
