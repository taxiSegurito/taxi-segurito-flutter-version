import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/services/DriversService.dart';

import 'DriversList.dart';
import '../../components/buttons/RefreshButton.dart';
import '../../components/inputs/SearchBar.dart';

class DriversListPage extends StatefulWidget {
  DriversListPage({Key? key}) : super(key: key);

  @override
  _DriversListPageState createState() => _DriversListPageState();
}

class _DriversListPageState extends State<DriversListPage> {
  DriversService driversService = new DriversService();
  late Future<List<Driver>> drivers;

  @override
  void initState() {
    super.initState();
    drivers = driversService.getByOwner();
  }

  void _loadDrivers() {
    setState(() {
      drivers = driversService.getByOwner();
    });
  }

  void _searchDriver(String value) {
    setState(() {
      drivers = driversService.getByCriteria(value);
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: SearchBar(
                      onSearch: _searchDriver,
                      hint: "Buscar por nombre, CI ...",
                    ),
                  ),
                ),
                RefreshButton(_loadDrivers),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: drivers,
              builder: (_, AsyncSnapshot<List<Driver>> snapshot) {
                if (snapshot.hasData) {
                  return DriversList(snapshot.data!);
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
