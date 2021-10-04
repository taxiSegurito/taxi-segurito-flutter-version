class Owner {
  String? idOwner;
  String fullname;
  String cellphone;
  String email;
  String password;
  String address;
  String ci;
  String idCompany;
  String? state;

  Owner(
      {this.idOwner,
      required this.fullname,
      required this.cellphone,
      required this.email,
      required this.password,
      required this.address,
      required this.ci,
      required this.idCompany,
      this.state});
}
