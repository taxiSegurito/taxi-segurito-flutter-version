import 'dart:ui';

class Vehicle {
  String? idVehicle;
  String color;
  String model;
  String pleik;
  String capacity;
  Image photo;
  String? status;
  DateTime? registerDate;
  DateTime? updateDate;
  String owner_idOwner;
  String report_car_idReports;

  //atributos con required son para insert
  Vehicle(
      {this.idVehicle,
      required this.color,
      required this.model,
      required this.pleik,
      required this.capacity,
      required this.photo,
      this.status,
      this.registerDate,
      this.updateDate,
      required this.owner_idOwner,
      required this.report_car_idReports});
}
