//Clase con un constructor para leer el archivo json desde php
class DataDriverSelect {
  String fullName = "";
  String cellphone = "";
  String email = "";
  String nacionalidad = "";
  String ci = "";
  String photo = "";
  String license = "";

  DataDriverSelect(String fullName, String cellphone, String email,
      String nacionalidad, String ci, String photo, String license) {
    this.fullName = fullName;
    this.cellphone = cellphone;
    this.email = email;
    this.nacionalidad = nacionalidad;
    this.ci = ci;
    this.photo = photo;
    this.license = license;
  }

  DataDriverSelect.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    cellphone = json['cellphone'];
    email = json['email'];
    nacionalidad = json['nacionalidad'];
    ci = json['ci'];
    photo = json['photo'];
    license = json['license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['cellphone'] = this.cellphone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['nacionalidad'] = this.nacionalidad;
    data['license'] = this.license;
    data['ci'] = this.ci;
    return data;
  }
}
