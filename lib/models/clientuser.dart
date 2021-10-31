import 'package:taxi_segurito_app/models/user.dart';

class Clientuser extends User {
  late String signUpType;

  Clientuser(this.signUpType);
  Clientuser.insert(
      {required String fullname,
      required String cellphone,
      required String email,
      required String password,
      required this.signUpType})
      : super.insert(
            fullname: fullname,
            cellphone: cellphone,
            email: email,
            password: password);
}
