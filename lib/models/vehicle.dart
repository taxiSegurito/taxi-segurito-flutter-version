import 'dart:typed_data';
import 'dart:ui';

import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';

class Vehicle {
  late int? idVehicle;
  late String color;
  late String model;
  late String pleik;
  late int capacity;
  late Uint8List picture;
  late String pictureStr;
  late int? idOwner;
  late int? status;

  Vehicle.empty() {
    this.color = '';
    this.model = '';
    this.pleik = '';
    this.capacity = 0;
    idOwner = null;
  }

  //atributos con required son para insert
  Vehicle({
    required this.color,
    required this.model,
    required this.pleik,
    required this.capacity,
    required this.picture,
    required this.idOwner,
    this.status,
    this.idVehicle,
  });

  Vehicle.insert({
    this.color = '',
    this.model = '',
    this.pleik = '',
    this.capacity = 0,
    this.pictureStr = '',
    this.idOwner = 0,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    this.idVehicle = json['idVehicle'] as int;
    this.color = json['color'] as String;
    this.model = json['model'] as String;
    this.pleik = json['pleik'] as String;
    this.capacity = json['capacity'] as int;
    this.idOwner = json['idOwner'] as int;
    this.status = json['status'] as int;

    String pictureBase64 = json['picture'] as String;
    this.picture = bytesFromBase64String(pictureBase64);
  }
}
