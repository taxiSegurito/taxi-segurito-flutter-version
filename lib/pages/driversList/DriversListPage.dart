import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

import 'DriversList.dart';

class DriversListPage extends StatefulWidget {
  DriversListPage({Key? key}) : super(key: key);

  @override
  _DriversListPageState createState() => _DriversListPageState();
}

class _DriversListPageState extends State<DriversListPage> {
  List<Driver> drivers = [];

  _DriversListPageState() {
    _loadDrivers();
  }

  void _loadDrivers() {
    // this.setState(() {
    drivers = [
      Driver("Juan Quiroga Lopez", "14789632", "71714906"),
      Driver("Marco Iriarte Lanza", "36987412", "61944760"),
    ];
    // });
  }

  void _refreshDrivers() {
    this.setState(() {
      drivers = [
        Driver("Juan Quiroga Lopez", "14789632", "71714906"),
        Driver("Marco Iriarte Lanza", "36987412", "61944760"),
        Driver("Alberto Flores Ojeda", "47896321", "64782135"),
        Driver("Roberto Linares Rodriguez", "89632147", "74539815"),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Conductores"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("Refresh"),
            onPressed: _refreshDrivers,
          ),
          Expanded(
            child: DriversList(drivers),
          ),
        ],
      ),
    );
  }
}
