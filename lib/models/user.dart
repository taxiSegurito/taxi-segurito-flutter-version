class User {
  late int iduser;
  late String email;
  late String password;
  late DateTime registerDate;
  late DateTime updateDate;
  late int status;

  User(this.iduser, this.email, this.password, this.registerDate,
      this.updateDate, this.status);

  User.insert(this.email, this.password);

  User.login(this.email, this.password);
}
