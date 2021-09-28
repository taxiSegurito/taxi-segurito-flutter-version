class Company {
  int? idCompani;
  String nameCopany;
  String nit;
  int? state;
  DateTime? registerDate;
  DateTime? updateDate;

  Company(
      {this.idCompani,
      required this.nameCopany,
      required this.nit,
      this.state,
      this.registerDate,
      this.updateDate});
}
