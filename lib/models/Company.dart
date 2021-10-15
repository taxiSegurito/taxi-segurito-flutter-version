class Company {
  String? idCompany;
  String companyName;
  String nit;
  String? status;
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
