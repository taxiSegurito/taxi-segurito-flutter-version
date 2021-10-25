import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';

class CustomListViewCardSimple extends StatefulWidget {
  List<Driver>? listDrivers = listDriver;
  _CustomListViewCardSimpleState _customListViewCardSimpleState =
      new _CustomListViewCardSimpleState();
  VoidCallback ontap;
  final void Function(Driver driver) callback;
  CustomListViewCardSimple(
      {Key? key, required this.ontap, required this.callback})
      : super(key: key);

  @override
  _CustomListViewCardSimpleState createState() {
    return _customListViewCardSimpleState;
  }

  updateListView() {
    _customListViewCardSimpleState.updateListView();
  }
}

class _CustomListViewCardSimpleState extends State<CustomListViewCardSimple> {
  updateListView() {
    setState(() {
      widget.listDrivers = listDriver;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: 300,
      width: width,
      child: ListView.builder(
          itemCount: widget.listDrivers!.length,
          itemBuilder: (context, index) {
            Driver driver = listDriver[index];
            return Card(
              child: Column(children: [
                ListTile(
                  title: Text(
                    driver.fullName,
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: Row(
                    children: [
                      Expanded(
                          child: Text("CI: " + driver.ci,
                              style: TextStyle(fontSize: 13))),
                      Expanded(
                          child: Text("Celular: " + driver.cellphone,
                              style: TextStyle(fontSize: 13)))
                    ],
                  ),
                  trailing: Icon(Icons.add),
                  onTap: () {
                    widget.callback(driver);
                  },
                ),
              ]),
            );
          }),
    );
  }
}
