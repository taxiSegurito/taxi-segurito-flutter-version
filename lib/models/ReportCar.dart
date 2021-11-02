import 'package:flutter/rendering.dart';

class ReportCar {
  late int? idReports;
  late double? calification;
  late String? comment;
  late int? idClientuser;
  late int? idVehicule;

  ReportCar({
    this.idClientuser,
    this.idReports,
    this.calification,
    this.comment,
    this.idVehicule,
  });
}
