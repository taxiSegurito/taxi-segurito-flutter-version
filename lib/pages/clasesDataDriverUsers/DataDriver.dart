//Clase con un constructor para leer el archivo json desde php datos del conductor
class DataDriver {
  String fullName = "";
  String cellphone = "";
  String ci = "";
  String photo = "";
  String license = "";

  DataDriver(String fullName, String cellphone, String ci, String photo,
      String license) {
    this.fullName = fullName;
    this.cellphone = cellphone;
    this.ci = ci;
    this.photo = photo;
    this.license = license;
  }

  DataDriver.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    cellphone = json['cellphone'];
    ci = json['ci'];
    photo = json['photo'];
    license = json['license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['cellphone'] = this.cellphone;
    data['photo'] = this.photo;
    data['license'] = this.license;
    data['ci'] = this.ci;
    return data;
  }
}
