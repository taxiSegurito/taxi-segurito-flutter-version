import 'dart:ui';

class Vehicle {
  String? idVehicle;
  String color;
  String model;
  String pleik;
  int capacity;
  Image? photo;
  String? status;
  DateTime? registerDate;
  DateTime? updateDate;
  String? idOwner;
  String? idReports;

  //atributos con required son para insert
  Vehicle(
      {this.idVehicle,
      required this.color,
      required this.model,
      required this.pleik,
      required this.capacity,
      this.photo,
      this.status,
      this.registerDate,
      this.updateDate,
      this.idOwner,
      this.idReports});
}
