class Driver {
  late String name;
  late String dni;
  late String phone;
  late String licence;
  late String photo;
  late int idowner;

  Driver(this.name, this.dni, this.phone);

  Driver.insert(
      this.name, this.phone, this.licence, this.dni, this.photo, this.idowner);
}
