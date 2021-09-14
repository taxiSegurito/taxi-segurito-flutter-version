import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/env.dart';
import 'package:taxi_segurito_app/models/user.dart';

Future<bool> login(User user) async {
  String path = Service.url + "login.php";
  var response = await http.post(Uri.parse(path), body: {
    "username": user.username,
    "password": user.password,
  });
  String result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
