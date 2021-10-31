import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/services/server.dart';

Future<bool> insertClient(Clientuser clientuser) async {
  String path = Server.url + "createUser.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": clientuser.fullName,
    "cellphone": clientuser.cellphone,
    "email": clientuser.email,
    "password": clientuser.password,
    "register": clientuser.signUpType
  });
  var result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
