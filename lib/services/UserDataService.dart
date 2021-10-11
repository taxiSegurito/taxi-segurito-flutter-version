import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/pages/listUsers/models/UserData.dart';
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<List<Owner>> select() async {
  try {
    String path = "http://192.168.3.6:8070/flutter/owner_controller.php";
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<Owner>>.value(convertToList(response));
    } else {
      return Future<List<Owner>>.value([]);
    }
  } catch (exception) {
    return Future<List<Owner>>.value([]);
  }
}

List<Owner> convertToList(response) {
  List<Owner> listUserData = [];
  for (var singleUser in json.decode(response.body)) {
    listUserData.add(Owner.fromJson(singleUser));
  }

  return listUserData;
}

Future<List<Owner>> selectByLike(value) async {
  String path = "http://10.0.2.2:8070/flutter/owner_controller.php";
  var response = await http.post(Uri.parse(path),
      body: jsonEncode({'valueSearch': value}));

  if (response.statusCode == 200) {
    return Future<List<Owner>>.value(convertToList(response));
  } else {
    return Future<List<Owner>>.value([]);
  }
}
