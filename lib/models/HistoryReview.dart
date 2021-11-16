class HistoryReviewModel {
  String? idVehicle;
  String? idClientUser;
  String? name;
  String? pleik;
  String? photo;
  String? coment;
  DateTime? dateRegister;
  String? calification;

  HistoryReviewModel({
    this.idVehicle,
    this.idClientUser,
    this.calification,
    this.coment,
    this.dateRegister,
    this.name,
    this.photo,
    this.pleik,
  });

  factory HistoryReviewModel.fromJson(Map<String, dynamic> json) {
    return HistoryReviewModel(
      idVehicle: json['idVehicle'].toString(),
      idClientUser: json['idClientUser'].toString(),
      name: json['name'].toString(),
      pleik: json['pleik'].toString(),
      photo: json['photo'].toString(),
      coment: json['coment'].toString(),
      dateRegister: DateTime.parse(['dataRegister'].toString()),
      calification: json['calification'].toString(),
    );
  }
}
