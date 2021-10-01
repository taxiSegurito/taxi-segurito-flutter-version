import 'dart:ffi';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataDriverSelect.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';

class PersonalDataDriver extends StatefulWidget {
  PersonalDataDriver({Key? key}) : super(key: key);

  @override
  _PersonalDataDriverState createState() => _PersonalDataDriverState();
}

String idDriver = "1";

class _PersonalDataDriverState extends State<PersonalDataDriver> {
  List<DataDriverSelect> data = List<DataDriverSelect>.empty(growable: true);
  Future<List<DataDriverSelect>> get_data() async {
    String path = Service.url + "selectDataDriver.php";
    //cadena de coneccion para php
    var response = await http.post(Uri.parse(path), body: {
      'idDriver': idDriver,
    }).timeout(Duration(seconds: 90));
    var datos = jsonDecode(response.body);

    var registros = new List<DataDriverSelect>.empty(growable: true);

    for (datos in datos) {
      registros.add(DataDriverSelect.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Datos Conductor'),
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
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 15),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data[0].photo),
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
                          data[0].fullName,
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
                        top: BorderSide(), horizontalInside: BorderSide()),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, right: 15),
                            child: Text(
                              data[0].ci,
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, right: 15),
                            child: Text(
                              data[0].cellphone,
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, right: 15),
                            child: Text(
                              data[0].email,
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                            margin:
                                EdgeInsets.only(top: 15, bottom: 15, right: 15),
                            child: Text(
                              data[0].nacionalidad,
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
                            margin: EdgeInsets.only(top: 15, left: 15),
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
                  width: 350,
                  height: 150,
                  alignment: Alignment.center,
                  child: CardForVehicule(),
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
        'Está seguro de que desea eliminar a Julio Rios Marcos',
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

//Card para mostrar el vehiculo
class CardForVehicule extends StatefulWidget {
  CardForVehicule({Key? key}) : super(key: key);

  @override
  _CardForVehiculeState createState() => _CardForVehiculeState();
}

class _CardForVehiculeState extends State<CardForVehicule> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                child: Image.asset(
                  "lib/components/assets/images/logoPrincipal.png",
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
                      'Toyota Caldina 1995',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1452PHDS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Color.fromRGBO(93, 93, 93, 1)),
                    )
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
