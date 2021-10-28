import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/user.dart';

Future<List<dynamic>> login(User user) async {
  String path = Service.url + "auth/login.php";

  var response = await http
      .get(Uri.parse(path + "?email=${user.email}&password=${user.password}"));

  List<dynamic> result = [];
  var res = json.decode(response.body);
  print(res);
  if (res != "Error") {
    result = res;
    return result;
  } else {
    return result;
  }
}
