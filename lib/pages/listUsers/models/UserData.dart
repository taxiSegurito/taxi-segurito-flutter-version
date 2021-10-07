import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:taxi_segurito_app/models/user.dart';

class UserData {
  String id;
  String name;
  String dni;
  String phone;
  String rol;
  ImageProvider photo;
  UserData(
      {required this.id,
      required this.name,
      required this.dni,
      required this.phone,
      required this.rol,
      required this.photo});

  factory UserData.fromJson(Map<String, dynamic> json) {
    Image photo = Image.asset("lib/components/assets/images/driver.jpg");
    return UserData(
        id: json['id'].toString(),
        name: json['firstName'].toString(),
        dni: json['semester'].toString(),
        phone: json['semester'].toString(),
        rol: json['city'].toString(),
        photo: photo.image);
  }
}
