class Company {
  String idCompany;
  String companyName;
  String nit;
  String status;
  String registerDate;
  String updateDate;

  Company({
    this.idCompany = '',
    this.companyName = '',
    this.nit = '',
    this.status = '',
    this.registerDate = '',
    this.updateDate = '',
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['name'].toString(),
      nit: json['nit'].toString(),
      idCompany: json['id'].toString(),
      status: json['status'].toString(),
    );
  }
}
