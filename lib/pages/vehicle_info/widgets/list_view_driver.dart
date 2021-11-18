import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/services/driver_service.dart';

class ListViewDrivers extends StatefulWidget {
  List<Driver>? listDrivers;
  _ListViewDriversState _customListViewCardSimpleState =
      new _ListViewDriversState();
  VoidCallback ontap;
  final void Function(Driver driver) callback;
  ListViewDrivers(
      {Key? key,
      required this.ontap,
      required this.callback,
      required this.listDrivers})
      : super(key: key);

  @override
  _ListViewDriversState createState() {
    return _customListViewCardSimpleState;
  }

  updateListView() {
    _customListViewCardSimpleState.updateListView();
  }
}

class _ListViewDriversState extends State<ListViewDrivers> {
  updateListView() {
    setState(() {
      //widget.listDrivers = listDriver;
    });
  }

  DriversService _driversService = DriversService();
  late Future<List<Driver>> drivers;

  @override
  void initState() {
    super.initState();
    drivers = _driversService.getDrivers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: 300,
        width: width,
        child: FutureBuilder(
          future: drivers,
          builder: (_, AsyncSnapshot<List<Driver>> snapshot) {
            if (snapshot.hasData) {
              final drivers = snapshot.data!;
              return ListView.builder(
                itemCount: drivers.length,
                itemBuilder: (_, index) {
                  Driver driver = drivers[index];
                  Color colors = Colors.black;
                  Color colorBackground = Colors.white;

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
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
