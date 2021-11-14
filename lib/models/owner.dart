class Owner {
  late String? idOwner;
  late String fullName;
  late String cellPhone;
  late String email;
  late String password;
  late String address;
  late String ci;
  late String idCompany;
  late String? status;

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

  Owner.init();

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
        idOwner: json['id'].toString(),
        fullName: json['fullName'].toString(),
        cellPhone: json['cellphone'].toString(),
        email: json['email'].toString(),
        password: json['password'].toString(),
        address: json['address'].toString(),
        ci: json['ci'].toString(),
        idCompany: json['idCompany'].toString(),
        status: json['status'].toString());
  }
}
