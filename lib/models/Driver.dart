class Driver {
  late String name;
  late String dni;
  late String phone;
  late String licence;
  late String photo;
  late int idowner;

  Driver(this.name, this.dni, this.phone);

  Driver.insert(
      {required this.name,
      required this.phone,
      required this.licence,
      required this.dni,
      required this.photo,
      required this.idowner});

  factory Driver.fromJason(Map<String, dynamic> json) {
    return Driver.insert(
        name: json['name'],
        phone: json['phone'],
        licence: json['licence'],
        dni: json['dni'],
        photo: json['photo'],
        idowner: json['idowner']);
  }
  Map<String, dynamic> jsonModel() {
    return {
      "name": name,
      "phone": phone,
      "licence": licence,
      "dni": dni,
      "photo": photo,
      "idowner": idowner
    };
  }
}
