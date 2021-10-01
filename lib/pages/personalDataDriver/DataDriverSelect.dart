//Clase con un constructor para leer el archivo json desde php
class DataDriverSelect {
  String fullName = "";
  String cellphone = "";
  String email = "";
  String nacionalidad = "";
  String ci = "";
  String photo = "";

  DataDriverSelect(String fullName, String cellphone, String email,
      String nacionalidad, String ci, String photo) {
    this.fullName = fullName;
    this.cellphone = cellphone;
    this.email = email;
    this.nacionalidad = nacionalidad;
    this.ci = ci;
    this.photo = photo;
  }

  DataDriverSelect.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    cellphone = json['cellphone'];
    email = json['email'];
    nacionalidad = json['nacionalidad'];
    ci = json['ci'];
    photo = json['photo'];
  }
}
