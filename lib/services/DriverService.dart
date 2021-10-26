import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<bool> update(Driver driver) async {
  var path = "http://localhost:8070/flutter/company_controller.php";
  final response = await http.put(
    Uri.parse(path),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {"name": "coma", "nit": "12345", "id": "55"},
    ),
  );
  String result = response.body;
  print(result);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
