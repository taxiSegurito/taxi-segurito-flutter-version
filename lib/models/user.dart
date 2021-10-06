import 'package:taxi_segurito_app/models/person.dart';

class User extends Person {
  late String email;
  late String password;
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

  User.login(this.email, this.password);
}
