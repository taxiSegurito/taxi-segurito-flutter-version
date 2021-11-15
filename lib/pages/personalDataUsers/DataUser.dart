import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataDriverSelect.dart';
import 'package:taxi_segurito_app/pages/personalDataUsers/DatauserFuctionality.dart';
import 'package:taxi_segurito_app/pages/personalDataUsers/widgets/driver_data.dart';
import 'package:taxi_segurito_app/pages/personalDataUsers/widgets/vehicle_data.dart';

class DataUser extends StatefulWidget {
  DataUser({Key? key}) : super(key: key);

  @override
  _DataUserState createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  DataUserFuctionality dataUserFuctionality = DataUserFuctionality();
  int idDriver = 6;
//datos primer select
  var dataOwner;
//datos para el select de los autos
  var dataVehicules;
//para el circular progressBar
  bool loading = true;
  bool listview = true;

  @override
  void initState() {
    super.initState();
    dataUserFuctionality.getData(idDriver).then((value) {
      setState(() {
        dataOwner = value;
        loading = false;
      });
    });
    dataUserFuctionality.getDataVehicule(idDriver).then((value) {
      setState(() {
        dataVehicules = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Vista Administrador'),
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
                          style:
                              TextStyle(color: Color.fromRGBO(242, 78, 30, 1)),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    onTap: () {
                      print("Estas en Eliminar");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialogDelete(dataOwner);
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
        body: SingleChildScrollView(
            child: loading == true
                ? Center(
                    child: Container(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ))
                : LayoutBuilder(
                    builder: (_, constraints) {
                      return Container(
                        height: constraints.maxHeight,
                        child: FutureBuilder(
                          future: dataOwner,
                          builder: (_,
                              AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return Column(
                                  children: [
                                    OwnerData(dataOwner),
                                    VehicleData(dataVehicules),
                                  ],
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      );
                    },
                  )));
  }
}

class AlertDialogDelete extends StatelessWidget {
  late DataDriverSelect dataDriverSelect;
  AlertDialogDelete(this.dataDriverSelect);
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Está seguro de que desea eliminar a ' + dataDriverSelect.fullName,
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
