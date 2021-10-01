import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/user.dart';

Future<List<dynamic>> login(User user) async {
  String path = Service.url + "login.php";
  var response = await http.post(Uri.parse(path), body: {
    "email": user.username,
    "password": user.password,
  });
  List<dynamic> result = [];
  var res = json.decode(response.body);
  if (res != "Error") {
    result = res;
    return result;
  } else {
    return result;
  }
}
