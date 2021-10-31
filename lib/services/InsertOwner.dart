import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<bool> insert(Owner owner) async {
  String path = Server.url + "Owner/owner_controller.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": owner.fullName,
    "cellphone": owner.cellPhone,
    "email": owner.email,
    "password": owner.password,
    "address": owner.address,
    "ci": owner.ci,
  });
  String result = json.decode(response.body);

  if (result == "success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
