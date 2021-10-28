import 'dart:ui';

class Vehicle {
  String? idVehicle;
  String color;
  String model;
  String pleik;
  String capacity;
  String photo;
  String? status;
  DateTime? registerDate;
  DateTime? updateDate;
  String owner_idOwner;
  String report_car_idReports;

  //atributos con required son para insert
  Vehicle({
    this.idVehicle = '',
    this.color = '',
    this.model = '',
    this.pleik = '',
    this.capacity = '',
    this.photo = '',
    this.status = '',
    this.registerDate,
    this.updateDate,
    this.owner_idOwner = '',
    this.report_car_idReports = '',
  });
}
