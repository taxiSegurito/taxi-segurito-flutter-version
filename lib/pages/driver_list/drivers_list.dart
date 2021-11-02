import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';

import 'driver_list_item.dart';

class DriversList extends StatelessWidget {
  final Future<List<Driver>> driversFuture;

  DriversList(this.driversFuture);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: driversFuture,
      builder: (_, AsyncSnapshot<List<Driver>> snapshot) {
        if (snapshot.hasData) {
          final drivers = snapshot.data!;
          return ListView.builder(
            itemCount: drivers.length,
            itemBuilder: (_, index) {
              return DriverListItem(drivers[index]);
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
