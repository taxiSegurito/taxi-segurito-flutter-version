import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';

Future<bool> insertClient(Clientuser clientuser) async {
  String path = Service.url + "createUser.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": clientuser.fullName,
    "cellphone": clientuser.cellphone,
    "email": clientuser.email,
    "password": clientuser.password,
    "register": clientuser.registerType
  });
  var result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
