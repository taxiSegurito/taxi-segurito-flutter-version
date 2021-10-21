//Clase con un constructor para leer el archivo json desde php
class DataVehiculesDriver {
  String iddriver = "";
  String photo = "";
  String model = "";
  String pleik = "";
  String idvehiculo = "";
  DataVehiculesDriver(String iddriver, String photo, String model, String pleik,
      String idvehiculo) {
    this.iddriver = iddriver;
    this.photo = photo;
    this.model = model;
    this.pleik = pleik;
    this.idvehiculo = idvehiculo;
  }

  DataVehiculesDriver.fromJson(Map<String, dynamic> json) {
    iddriver = json['iddriver'];
    photo = json['photo'];
    model = json['model'];
    pleik = json['pleik'];
    idvehiculo = json['idvehiculo'];
  }
}