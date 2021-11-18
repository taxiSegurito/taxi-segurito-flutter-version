class ReportCar {
  late int? idReports;
  late double? calification;
  late String? comment;
  late int? idClientuser;
  late int? idVehicule;
  late String? datetime;

  ReportCar({
    this.idClientuser,
    this.idReports,
    this.calification,
    this.comment,
    this.idVehicule,
  });

  ReportCar.fromJson(Map<String, dynamic> json) {
    this.idReports = json['id'] as int;
    this.calification = double.parse(json['calification'] as String);
    this.comment = json['comment'] as String;
    this.idClientuser = json['clientUserId'] as int;
    this.idVehicule = json['vehicleId'] as int;
    this.datetime = json['createdAt'] as String;
  }
}
