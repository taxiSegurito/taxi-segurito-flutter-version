//Clase con un constructor para leer el archivo json desde php
class DataVehiculesDriver {
  int iddriver = 0;
  String photo = "";
  String model = "";
  String pleik = "";
  int idvehiculo = 0;
  String color = "";
  DataVehiculesDriver(int iddriver, String photo, String model, String pleik,
      int idvehiculo, String color) {
    this.iddriver = iddriver;
    this.photo = photo;
    this.model = model;
    this.pleik = pleik;
    this.idvehiculo = idvehiculo;
    this.color = color;
  }

  DataVehiculesDriver.fromJson(Map<String, dynamic> json) {
    iddriver = json['iddriver'];
    photo = json['photo'];
    model = json['model'];
    pleik = json['pleik'];
    idvehiculo = json['idvehiculo'];
    color = json['color'];
  }
}
