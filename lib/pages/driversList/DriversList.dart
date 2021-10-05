import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistration.dart';

class DriversList extends StatefulWidget {
  DriversList({Key? key}) : super(key: key);

  @override
  _DriversListState createState() => _DriversListState();
}

class _DriversListState extends State<DriversList> {
  @override
  Widget build(BuildContext context) {
    Text title = Text(
      "Lista Conductores",
      style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontFamily: "Raleway",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.justify,
    );
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DriverRegistration()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
