//clase para mostrar los datos del conductor y su vehiculo asignado despues del qr
class DataDriverVehicule {
  String iddriver = "";
  String fullname = "";
  String cellphone = "";
  String ci = "";
  String photo = "";
  String idvehicule = "";
  String pleik = "";
  String model = "";
  String color = "";
  String photovehicule = "";
  //String puntaje = "";

  DataDriverVehicule(
      String iddriver,
      String fullName,
      String cellphone,
      String ci,
      String photo,
      String idvehicule,
      String placa,
      String model,
      String color,
      String photovehicule) {
    this.iddriver = iddriver;
    this.fullname = fullname;
    this.cellphone = cellphone;
    this.ci = ci;
    this.photo = photo;
    this.idvehicule = idvehicule;
    this.pleik = placa;
    this.model = model;
    this.color = color;
    this.photovehicule = photovehicule;
  }

  DataDriverVehicule.fromJson(Map<String, dynamic> json) {
    iddriver = json['iddriver'];
    fullname = json['fullname'];
    cellphone = json['cellphone'];
    ci = json['ci'];
    photo = json['photo'];
    idvehicule = json['idvehicule'];
    pleik = json['pleik'];
    model = json['model'];
    color = json['color'];
    photovehicule = json['photovehicule'];
  }
}
