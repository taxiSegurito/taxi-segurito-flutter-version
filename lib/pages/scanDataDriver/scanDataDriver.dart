//ventana datos del conductor despues de leer el qr
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataDriverVehicule.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(ScanDataDriver("prueba"));
double ranking = 4.2;

class ScanDataDriver extends StatelessWidget {
  //const scanDataDriver({Key? key}) : super(key: key);
  String code;
  ScanDataDriver(this.code);

  @override
  Widget build(BuildContext context) {
    //log(code.toString());
    return MaterialApp(
      title: "Datos Conductor",
      home: Inicio(code),
    );
  }
}

//placa del vehiculo para hacer la busqueda en base de datos y url de conexion

String path = Service.url;
//datos select
var data;
var registros;
var codigo;
//para el circular progressBar
bool loading = true;

var placaVehicule = codigo.toString();

//obtener datos del usuario
Future<List<DataDriverVehicule>> getData() async {
  //cadena de coneccion para php
  data = List<DataDriverVehicule>.empty(growable: true);
  path = path + "selectDataDriverVehicule.php";
  var response = await http.post(Uri.parse(path), body: {
    'pleik': placaVehicule,
  }).timeout(Duration(seconds: 90));

  var datos = jsonDecode(response.body);

  registros = List<DataDriverVehicule>.empty(growable: true);

  for (datos in datos) {
    registros.add(DataDriverVehicule.fromJson(datos));
  }
  return registros;
}

class Inicio extends StatefulWidget {
  //Inicio({Key? key}) : super(key: key);
  String code;
  Inicio(this.code);

  @override
  _InicioState createState() => _InicioState(code);
}

class _InicioState extends State<Inicio> {
  String code;
  _InicioState(this.code);

  @override
  void initState() {
    super.initState();
    log(code);
    codigo = code;
    getData().then((value) {
      setState(() {
        data = value;
        loading = false;
      });
    });
    codigo = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Datos Conductor'),
        backgroundColor: Color.fromRGBO(242, 213, 60, 1),
      ),
      drawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            width: 270,
            child: BarButton(),
          )),
      //Codigo para el diseño del cuerpo de la ventana
      body: Wrap(
        children: [
          SingleChildScrollView(
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
                          margin: EdgeInsets.only(top: 50, bottom: 15),
                          alignment: Alignment.center,
                          child: Text(
                            "Taxi Seguro",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Raleway',
                                fontSize: 24,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, right: 7),
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      radius: 55,
                                      backgroundImage:
                                          NetworkImage(data[0].photo),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Wrap(
                                          children: [
                                            Text(
                                              data[0].fullname,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Raleway',
                                                  fontSize: 22,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "CI: " + data[0].ci,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      178, 178, 178, 1),
                                                  fontFamily: 'Raleway',
                                                  fontSize: 18,
                                                  letterSpacing: 0),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              size: 18,
                                              color: Color.fromRGBO(
                                                  178, 178, 178, 1),
                                            ),
                                            Text(
                                              data[0].cellphone,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      178, 178, 178, 1),
                                                  fontFamily: 'Raleway',
                                                  fontSize: 18,
                                                  letterSpacing: 0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Contanedor del rating del vehiculo demostrado en estrellas :D
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Table(
                            columnWidths: {1: FractionColumnWidth(0.7)},
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      ranking.toString(),
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Raleway',
                                          fontSize: 30,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  //Aqui se pone el puntaje del chofer en la propiedad rating
                                  Container(
                                    alignment: Alignment.center,
                                    child: RatingBarIndicator(
                                      rating: ranking,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 35.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //card para el vehiculo
                        Container(
                          width: 300,
                          height: 254,
                          margin: EdgeInsets.only(bottom: 15),
                          child: CardVehiculeData(),
                        ),
                        //Botones para moverse a otras pantallas
                        Container(
                          width: 350,
                          margin: EdgeInsets.only(bottom: 15),
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 2.5),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            side: MaterialStateProperty.all<BorderSide>(
                                                BorderSide(
                                                    width: 1,
                                                    color: Color.fromRGBO(
                                                        242, 176, 53, 1)))),
                                        onPressed: () {
                                          print("Escanear QR");
                                        },
                                        child: Text(
                                          "Escanear QR",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(242, 176, 53, 1),
                                            fontFamily: 'Raleway',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                          ),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 2.5),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape:
                                              MaterialStateProperty.all<OutlinedBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(242, 176, 53, 1)),
                                          side: MaterialStateProperty.all<BorderSide>(
                                              BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      242, 176, 53, 1)))),
                                      onPressed: () {
                                        print("Nueva reseña");
                                      },
                                      child: Text(
                                        "Nueva Reseña",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

//boton menu lateral con las opciones de usuario
class BarButton extends StatefulWidget {
  BarButton({Key? key}) : super(key: key);

  @override
  _BarButtonState createState() => _BarButtonState();
}

class _BarButtonState extends State<BarButton> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 140,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 213, 60, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                          'http://assets.stickpng.com/images/585e4bd7cb11b227491c3397.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Mariana Villazon",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .4),
                    child: Text(
                      "7894548",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontFamily: 'Raleway',
                        fontSize: 12,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Historial de reseñas",
              style: TextStyle(
                  color: Color.fromRGBO(93, 93, 93, 1),
                  fontFamily: 'Raleway',
                  fontSize: 14,
                  letterSpacing: 0),
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.access_time),
            onTap: () {
              print("Historial reseñas");
            },
          ),
          Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              "Contactos de emergencia",
              style: TextStyle(
                  color: Color.fromRGBO(93, 93, 93, 1),
                  fontFamily: 'Raleway',
                  fontSize: 14,
                  letterSpacing: 0),
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.contacts),
            onTap: () {
              print("Contactos de emergencia");
            },
          ),
          Container(
            color: Color.fromRGBO(255, 176, 153, 0.2800000011920929),
            child: ListTile(
              title: Text(
                "Botón de pánico",
                style: TextStyle(
                    color: Color.fromRGBO(242, 78, 29, 0.7599999904632568),
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              leading: Icon(
                Icons.warning,
                color: Color.fromRGBO(242, 78, 29, 0.7599999904632568),
              ),
              onTap: () {
                print("Botón de pánico");
              },
            ),
          )
        ],
      ),
    );
  }
}

//Card para mostrar los datos del vehiculo asignado al chofer
class CardVehiculeData extends StatefulWidget {
  CardVehiculeData({Key? key}) : super(key: key);

  @override
  _CardVehiculeDataState createState() => _CardVehiculeDataState();
}

class _CardVehiculeDataState extends State<CardVehiculeData> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white70,
      child: SizedBox(
        child: Column(
          children: [
            Table(
              columnWidths: {1: FractionColumnWidth(0.6)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 7, bottom: 10),
                    child:
                        Icon(Icons.local_taxi, size: 70, color: Colors.amber),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Placa: ",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              data[0].pleik,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Raleway',
                                  fontSize: 18,
                                  letterSpacing: 0),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Modelo: ",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Flexible(
                              child: Text(
                                data[0].model,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    letterSpacing: 0),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              data[0].color,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Raleway',
                                  fontSize: 12,
                                  letterSpacing: 0),
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ])
              ],
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.1),
                child: Image.network(
                  data[0].photovehicule,
                  width: 256,
                  height: 155,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
