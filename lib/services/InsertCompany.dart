import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Company.dart';

Future<bool> insert(Company company) async {
  var path = Service.url + "insertcompany.php";
  final response = await http.post(Uri.parse(path), body: {
    'name': company.nameCopany,
    'nit': company.nit,
  });
  String result = json.decode(response.body);
  //String result = response.body;
  Fluttertoast.showToast(
      msg: result,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.yellow);

  if (result == "success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
