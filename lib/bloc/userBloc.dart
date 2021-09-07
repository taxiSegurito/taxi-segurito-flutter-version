import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/env.dart';
import 'package:taxi_segurito_app/models/usuario.dart';

Future<bool> login(Usuario us) async {
  var path = Service.url + "login.php";
  var response = await http.post(Uri.parse(path), body: {
    "username": us.username,
    "password": us.password,
  });
  var res = json.decode(response.body);

  if (res == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
