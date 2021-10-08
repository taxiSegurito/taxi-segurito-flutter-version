import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/pages/listUsers/models/UserData.dart';
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<List<UserData>> select() async {
  try {
    String path = "http://192.168.3.6:8070/flutter/userData_controller.php";
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<UserData>>.value(convertToList(response));
    } else {
      return Future<List<UserData>>.value([]);
    }
  } catch (exception) {
    return Future<List<UserData>>.value([]);
  }
}

List<UserData> convertToList(response) {
  List<UserData> listUserData = [];
  for (var singleUser in json.decode(response.body)) {
    listUserData.add(UserData.fromJson(singleUser));
  }

  return listUserData;
}

Future<List<UserData>> selectByLike() async {
  String path = "http://10.0.2.2:8070/flutter/userData_controller.php";
  var response = await http.get(Uri.parse(path));

  if (response.statusCode == 200) {
    return Future<List<UserData>>.value(convertToList(response));
  } else {
    return Future<List<UserData>>.value(null);
  }
}
