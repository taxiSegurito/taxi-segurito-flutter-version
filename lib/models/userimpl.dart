import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/env.dart';
import 'package:taxi_segurito_app/models/person.dart';
import 'package:taxi_segurito_app/models/user.dart';

Future<bool> insertClient(
    Person person, User user, Clientuser clientuser) async {
  String path = Service.url + "createUser.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": person.fullName,
    "cellphone": person.cellphone,
    "email": user.email,
    "password": user.password,
    "register": clientuser.register
  });
  var result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
