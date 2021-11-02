class Owner {
  String? idOwner;
  String fullName;
  String cellPhone;
  String email;
  String password;
  String address;
  String ci;
  String idCompany;
  String? status;

  Owner(
      {this.idOwner,
      required this.fullName,
      required this.cellPhone,
      required this.email,
      required this.password,
      required this.address,
      required this.ci,
      required this.idCompany,
      this.status});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
        idOwner: json['id'].toString(),
        fullName: json['fullName'].toString(),
        cellPhone: json['phone'].toString(),
        email: json['email'].toString(),
        password: json['password'].toString(),
        address: json['address'].toString(),
        ci: json['ci'].toString(),
        idCompany: json['idCompany'].toString(),
        status: json['status'].toString());
  }
}
