import 'dart:math';
import 'package:taxi_segurito_app/bloc/implementation/userimpl.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/person.dart';
import 'package:taxi_segurito_app/models/user.dart';

class RegisterFunctionality {
  String generateCode() {
    String code = "";
    var rng = new Random();
    for (var i = 0; i < 6; i++) {
      code = code + rng.nextInt(9).toString();
    }
    return code;
  }

  registerClient(Person person, User user, Clientuser clientuser) async {
    final result = await insertClient(person, user, clientuser);
    if (result) {
      print("insertado");
    } else {
      print("no insertado");
    }
  }
}
