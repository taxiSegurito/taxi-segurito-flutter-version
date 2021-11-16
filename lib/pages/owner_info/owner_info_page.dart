import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/owner_info/widgets/owner_data.dart';
import 'package:taxi_segurito_app/pages/owner_info/widgets/vehicle_data.dart';
import 'package:taxi_segurito_app/services/vehicle_service.dart';

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
                    Navigator.pop(context);
                    print("Estas en modificar");
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
