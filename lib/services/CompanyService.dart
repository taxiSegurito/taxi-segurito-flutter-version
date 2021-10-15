import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Company.dart';

Future<bool> insert(Company company) async {
  var path = Service.url + "insertCompany.php";
  final response = await http.post(Uri.parse(path), body: {
    'name': company.companyName,
    'nit': company.nit,
  });
  String result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}

Future<bool> update(Company company) async {
  var path = "https://jsonplaceholder.typicode.com/albums/1";
  final response = await http.put(
    Uri.parse(path),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'title': company.companyName,
      },
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
