import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataDriverSelect.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataVehiculesDriver.dart';
import 'package:taxi_segurito_app/pages/personalDataDriver/personalDataDriver.dart';

void main() => runApp(personalDataUser());

// ignore: camel_case_types
class personalDataUser extends StatelessWidget {
  const personalDataUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Data User",
      home: Inicio(),
    );
  }
}

//id conductor para hacer la busqueda en base de datos y url de conexion
String idDriver = "6";
String path = Service.url;
//datos primer select
var data;
var registros;
//para el circular progressBar
bool loading = true;
bool listview = true;
//datos para el select de los autos
var dataVehicules;
var registros1;

//obtener datos del usuario
Future<DataDriverSelect> getData() async {
  //cadena de coneccion para php
  path = path + "selectDataOwner.php";
  var response = await http.post(Uri.parse(path), body: {
    'idDriver': idDriver,
  }).timeout(Duration(seconds: 90));

  final datos = jsonDecode(response.body);
  registros = new DataDriverSelect.fromJson(datos);

  return registros;
}

//obtener lista datos de los vehiculos del usuario
Future<List<DataVehiculesDriver>> getDataVehicule() async {
  //cadena de coneccion para php
  dataVehicules = List<DataVehiculesDriver>.empty(growable: true);
  var url = Service.url + "selectVehiculesOwner.php";
  var response1 = await http.post(Uri.parse(url), body: {
    'idDriver': idDriver,
  }).timeout(Duration(seconds: 90));
  var datos1 = jsonDecode(response1.body);
  registros1 = List<DataVehiculesDriver>.empty(growable: true);
  for (datos1 in datos1) {
    registros1.add(DataVehiculesDriver.fromJson(datos1));
  }
  return registros1;
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data = value;
        loading = false;
      });
    });
    getDataVehicule().then((values) {
      setState(() {
        dataVehicules.addAll(values);
        listview = false;
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
                            return AlertDialogDelete();
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
        //Inicio del armado del cuerpo de la interfaz
        body: SingleChildScrollView(
          //Control que los datos hayan cargado si no muestra circularProgressBar
          child: loading == true
              ? Center(
                  child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ))
              : Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 15),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(data.photo),
                          radius: 75,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                'Conductor',
                                style: TextStyle(
                                    color: Color.fromRGBO(93, 93, 93, 1),
                                    fontFamily: 'Raleway',
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, bottom: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                data?.fullName,
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 26,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      //container que almacena una tabla para mostrar los datos
                      Container(
                        child: Table(
                          border: TableBorder(
                              top: BorderSide(),
                              horizontalInside: BorderSide()),
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Text(
                                    'Carnet de Identidad:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, right: 15),
                                  child: Text(
                                    data?.ci,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Text(
                                    'Licencia:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, right: 15),
                                  child: Text(
                                    data?.license,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Text(
                                    'Celular:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, right: 15),
                                  child: Text(
                                    data?.cellphone,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Text(
                                    'Correo:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, right: 15),
                                  child: Text(
                                    data?.email,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15),
                                  child: Text(
                                    'Nacionalidad:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, bottom: 15, right: 15),
                                  child: Text(
                                    data?.nacionalidad,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, left: 15, bottom: 20),
                                  child: Text(
                                    'Vehiculo(s) Asignados:',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15, right: 15),
                                  child: Text(
                                    'Boliviana/o',
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 0,
                                        color: Color.fromRGBO(93, 93, 93, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Container que almacenara los cards de vehiculos asignados
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 350,
                        height: 150,
                        alignment: Alignment.center,
                        child: listview == true
                            ? Center(
                                child: Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ))
                            : ListViewVehicules(),
                      )
                    ],
                  ),
                ),
        ));
  }
}

//Widget AlertDialog confirmacion para eliminar un conductor de la base de datos
class AlertDialogDelete extends StatelessWidget {
  const AlertDialogDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Está seguro de que desea eliminar a ' + data?.fullName,
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

//ListView con los cardds para mostrar todos los vehiculos que tiene el conductor

class ListViewVehicules extends StatefulWidget {
  ListViewVehicules({Key? key}) : super(key: key);

  @override
  _ListViewVehiculesState createState() => _ListViewVehiculesState();
}

class _ListViewVehiculesState extends State<ListViewVehicules> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataVehicules.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            //viene el codigo despues de presionar el card respectivo
            print('Has Selecionado el Vehiculo: ' +
                dataVehicules[index].idvehiculo +
                ' ' +
                dataVehicules[index].model);
          },
          child: Card(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white70,
            child: SizedBox(
              child: Table(
                children: [
                  TableRow(children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.network(
                        dataVehicules[index].photo,
                        width: 70,
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 15),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            dataVehicules[index].model,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 15,
                                color: Color.fromRGBO(93, 93, 93, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dataVehicules[index].pleik,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                color: Color.fromRGBO(93, 93, 93, 1)),
                          )
                        ],
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
