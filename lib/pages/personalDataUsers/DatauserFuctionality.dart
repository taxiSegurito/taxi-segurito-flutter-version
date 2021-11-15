import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataDriverSelect.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataVehiculesDriver.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/server.dart';

class DataUserFuctionality {
  //obtener datos del Owner
  Future<DataDriverSelect> getData(int idDriver) async {
    //cadena de coneccion para php
    var path = "${Server.url}/getOwner/selectDataOwner.php";

    var response = await http.post(Uri.parse(path), body: {
      'idDriver': idDriver.toString(),
    });

    final datos = jsonDecode(response.body);
    var registros = new DataDriverSelect.fromJson(datos);

    return registros;
  }

//obtener lista datos de los vehiculos del usuario
  Future<List<DataVehiculesDriver>> getDataVehicule(int idDriver) async {
    //cadena de coneccion para php
    var dataVehicules = List<DataVehiculesDriver>.empty(growable: true);
    var url = "${Server.url}/getOwner/selectVehiculesOwner.php";

    var response1 = await http.post(Uri.parse(url), body: {
      'idDriver': idDriver.toString(),
    });
    var datos1 = jsonDecode(response1.body);
    for (datos1 in datos1) {
      dataVehicules.add(DataVehiculesDriver.fromJson(datos1));
    }
    return dataVehicules;
  }
}
