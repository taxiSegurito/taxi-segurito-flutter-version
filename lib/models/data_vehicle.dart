class Data_Vehicle {
  int? idVehicle;
  String? color;
  String? model;
  String? pleik;
  String? capacity;
  String? photo;

  //atributos con required son para insert
  Data_Vehicle({
    this.idVehicle,
    required this.color,
    required this.model,
    required this.pleik,
    required this.capacity,
    required this.photo,
  });

  Data_Vehicle.fromJson(Map<String, dynamic> json) {
    idVehicle = json['idVehicle'] as int;
    model = json['model'] as String;
    color = json['color'] as String;
    pleik = json['pleik'] as String;
    capacity = (json['capacity'] as int).toString();
    photo = json['picture'] as String;
  }
}
