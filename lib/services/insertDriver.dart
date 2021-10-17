import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

Future<bool> insertDriver(Driver driver) async {
  String path = Service.url + "crearDriver.php";
  var response = await http.post(Uri.parse(path), body: {
    "name": driver.name,
    "dni": driver.dni,
    "phone": driver.phone,
    "licence": driver.licence,
    "photo": driver.photo,
    "idowner": driver.idowner.toString(),
  });
  String result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
