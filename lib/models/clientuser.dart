import 'package:taxi_segurito_app/models/user.dart';

class Clientuser extends User {
  late String registerType;

  Clientuser(this.registerType);
  Clientuser.insert(
      {required String fullname,
      required String cellphone,
      required String email,
      required String password,
      required this.registerType})
      : super.insert(
            fullname: fullname,
            cellphone: cellphone,
            email: email,
            password: password);
}
