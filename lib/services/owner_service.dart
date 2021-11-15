import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/owner.dart';

class OwnerService {
  Future<bool> insert(Owner owner) async {
    String path = '${Server.url}/Owner/owner_controller.php';
    var response = await http.post(
      Uri.parse(path),
      body: jsonEncode({
        'fullname': owner.fullName,
        'cellphone': owner.cellPhone,
        'email': owner.email,
        'password': owner.password,
        'address': owner.address,
        'ci': owner.ci,
        'companyid': owner.idCompany,
      }),
    );

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

  Future<Owner> selectById(int ownerId) async {
    final queryParams = {'ownerId': ownerId.toString()};
    final endpoint = Uri.http(Server.host,
        '${Server.baseEndpoint}/Owner/owner_controller.php', queryParams);
    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final owner = Owner.fromJson(body);
      return owner;
    }
    throw 'Unable to retrieve owner';
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
