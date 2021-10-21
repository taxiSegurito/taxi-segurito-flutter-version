import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';

import 'VehicleListItem.dart';

class VehiclesListPage extends StatefulWidget {
  VehiclesListPage({Key? key}) : super(key: key);

  @override
  _VehiclesListPageState createState() => _VehiclesListPageState();
}

class _VehiclesListPageState extends State<VehiclesListPage> {
  List<Vehicle> vehicles = [];

  void _loadVehicles() {}

  void _refreshVehicles() {}

  void _searchVehicle() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Vehículos"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 8),
                //     child: SearchBar(
                //       onSearch: _searchDriver,
                //       hint: "Buscar por nombre, CI ...",
                //     ),
                //   ),
                // ),
                // RefreshButton(_refreshDrivers),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.25,
                children: [
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                  VehicleListItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
