import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/owner.dart';

class OwnerService {
  Future<bool> insert(Owner owner) async {
    String path = '${Server.url}/Owner/owner_controller.php';
    var response = await http.post(Uri.parse(path), body: {
      'fullname': owner.fullName,
      'cellphone': owner.cellPhone,
      'email': owner.email,
      'password': owner.password,
      'address': owner.address,
      'ci': owner.ci,
    });

    return response.statusCode == 200;
  }

  Future<List<Owner>> select() async {
    String path = '${Server.url}/Owner/owner_controller.php';
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return convertToList(response);
    }
    throw 'Unable to retrieve owners';
  }

  Future<List<Owner>> selectByNameCiOrPhone(criteria) async {
    String path = '${Server.url}/Owner/owner_controller.php?criteria=$criteria';
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return convertToList(response);
    }
    throw 'Unable to retrieve owners';
  }

  List<Owner> convertToList(response) {
    List<dynamic> body = jsonDecode(response.body);
    List<Owner> owners = body.map((o) => Owner.fromJson(o)).toList();
    return owners;
  }
}
