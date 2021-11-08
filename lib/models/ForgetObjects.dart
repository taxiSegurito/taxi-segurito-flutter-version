class ForgetObjectsList{
  String idForgetObject;
  String nameObject;
  String description;
  String status;
  String registerDate;
  String updateDate;
  String idVehicle;
  String idclientuser;
  ForgetObjectsList({
    required this.idForgetObject,
    required this.nameObject,
    required this.description,
    required this.status,
    required this.registerDate,
    required this.updateDate,
    required this.idVehicle,
    required this.idclientuser
  });

  factory ForgetObjectsList.fromJson(Map<String, dynamic> json) {
    return ForgetObjectsList(
      idForgetObject: json["idForgetObject"].toString(),
      nameObject: json["nameObject"].toString(),
      description: json["description"].toString(),
      status: json["status"].toString(),
      registerDate: json["registerDate"].toString(),
      updateDate: json["updateDate"].toString(),
      idVehicle: json["idVehicle"].toString(),
      idclientuser: json["idclientuser"].toString());
  }

}