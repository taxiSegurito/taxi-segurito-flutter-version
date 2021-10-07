import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/pages/listUsers/models/UserData.dart';
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<bool> insert(Owner owner) async {
  String path = Service.url + "insertowner.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": owner.fullname,
    "cellphone": owner.cellphone,
    "email": owner.email,
    "password": owner.password,
    "address": owner.address,
    "ci": owner.ci,
  });
  String result = json.decode(response.body);

  if (result == "success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}

Future<bool> select(Owner owner) async {
  String path = Service.url + "insertowner.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": owner.fullname,
    "cellphone": owner.cellphone,
    "email": owner.email,
    "password": owner.password,
    "address": owner.address,
    "ci": owner.ci,
  });
  String result = json.decode(response.body);

  if (result == "success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}

Future<List<UserData>> getDataUserInfo() async {
  String path = "http://10.0.2.2:8070/flutter/students_controller.php";
  var response = await http.get(Uri.parse(path));

  if (response.statusCode == 200) {
    return Future<List<UserData>>.value(convertToList(response));
  } else {
    return Future<List<UserData>>.value(null);
  }
}

List<UserData> convertToList(response) {
  List<UserData> listUserData = [];
  for (var singleUser in json.decode(response.body)) {
    listUserData.add(UserData.fromJson(singleUser));
  }

  return listUserData;
}
