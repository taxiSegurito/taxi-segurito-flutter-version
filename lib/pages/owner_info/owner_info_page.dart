import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/owner_info/widgets/owner_data.dart';
import 'package:taxi_segurito_app/pages/owner_info/widgets/vehicle_data.dart';
import 'package:taxi_segurito_app/pages/owner_register/UpdateOwnerScreen.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/services/vehicle_service.dart';
import 'package:http/http.dart' as http;

class OwnerInfoPage extends StatefulWidget {
  Owner owner;
  OwnerInfoPage(this.owner, {Key? key}) : super(key: key);

  @override
  _OwnerInfoPageState createState() => _OwnerInfoPageState();
}

class _OwnerInfoPageState extends State<OwnerInfoPage> {
  VehicleService _vehicleService = VehicleService();
  late Future<List<Vehicle>> vehiclesFuture;

  @override
  void initState() {
    super.initState();
    vehiclesFuture =
        _vehicleService.getVehiclesByOwnerId(int.parse(widget.owner.idOwner!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: Text('Datos de propietario'),
          actions: <Widget>[
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        'Editar',
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new UpdateOwnerScreen(widget.owner)));
                  },
                )),
                PopupMenuItem(
                    child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        'Eliminar',
                        style: TextStyle(color: Color.fromRGBO(242, 78, 30, 1)),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  onTap: () {
                    print("Estas en Eliminar");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogDelete(widget.owner);
                        });
                  },
                ))
              ];
            })
          ],
          backgroundColor: Color.fromRGBO(242, 213, 60, 1),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ));
            },
          )),
      body: Column(
        children: [
          OwnerData(widget.owner),
          Expanded(
            child: FutureBuilder(
              future: vehiclesFuture,
              builder: (_, AsyncSnapshot<List<Vehicle>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    final vehicles = snapshot.data!;
                    return ListView.builder(
                      itemCount: vehicles.length,
                      itemBuilder: (_, index) {
                        return VehicleData(vehicles[index]);
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
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

Future<bool> deleteOwner(Owner owner) async {
  try {
    String path = '${Server.url}/Owner/owner_controller.php';
    var response = await http.delete(Uri.parse(path),
        body: jsonEncode({"id": owner.idOwner.toString()}));
    var result = jsonDecode(response.body);
    if (result == 1) {
      print("Borrado Exitosamente" + result.toString());
      return Future<bool>.value(true);
    } else {
      print("Error : " + result);
      return Future<bool>.value(false);
    }
  } catch (exception) {
    log(exception.toString());
    return Future<bool>.value(false);
  }
}

class AlertDialogDelete extends StatelessWidget {
  late Owner owner;
  AlertDialogDelete(this.owner);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        '¿Está seguro de eliminar a ${owner.fullName}?',
        style:
            TextStyle(color: Colors.black, fontFamily: 'Raleway', fontSize: 18),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            child: Text(
              'Eliminar',
              style: TextStyle(
                  color: Colors.red, fontFamily: 'Raleway', fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).pop('Aceptar');
              print('Eliminar conductor');
              deleteOwner(owner);
            }),
        CupertinoDialogAction(
          child: Text(
            'Cancelar',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Raleway', fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop('Cancelar');
            print('Cancelar eliminacion');
          },
        )
      ],
    );
  }
}
