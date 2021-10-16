import 'dart:convert';

import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/emergencycontact.dart';
import 'package:http/http.dart' as http;

class LocationFunctionality {
  Future<List<EmergencyContact>> listContac(String idCLient) async {
    String path = Service.url + "listContact.php";
    var response = await http.post(Uri.parse(path), body: {
      'idcliente': idCLient,
    }).timeout(Duration(seconds: 90));
    List<dynamic> result = [];
    var datos = json.decode(response.body);
    var res = List<EmergencyContact>.empty(growable: true);

    if (datos != "Error") {
      result = datos;
      for (var value in result) {
        res.add(EmergencyContact.fromJson(value));
      }
    }
    return res;
  }
}
