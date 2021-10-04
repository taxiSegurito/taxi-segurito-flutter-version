class Company {
  int? idCompany;
  String companyName;
  String nit;
  int? status;
  DateTime? registerDate;
  DateTime? updateDate;

  Company(
      {this.idCompany,
      required this.companyName,
      required this.nit,
      this.status,
      this.registerDate,
      this.updateDate});
}
