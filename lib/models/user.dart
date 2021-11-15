import 'package:taxi_segurito_app/models/person.dart';

class User extends Person {
  late String email;
  late String password;
  late String role;
  late DateTime registerDate;
  late DateTime updateDate;
  late int status;

  User();
  User.get(this.email, this.password, this.registerDate, this.updateDate,
      this.status);
  User.insert(
      {required String fullname,
      required String cellphone,
      required this.email,
      required this.password})
      : super.insert(fullname, cellphone);
  User.update(int idPerson, String fullname, String cellphone)
      : super.update(
        idPerson,
        fullname,
        cellphone);
  User.delete(int idPerson)
      : super.delete(
        idPerson);
  User.login(this.email, this.password);
  User.logInResponse(int id, this.role, String fullname)
      : super.logIn(id, fullname);
}
