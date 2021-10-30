import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/Server.dart';
import 'package:taxi_segurito_app/models/Company.dart';

Future<bool> insert(Company company) async {
  var path = Server.url + "Company/company_controller.php";
  final response = await http.post(Uri.parse(path), body: {
    'name': company.companyName,
    'nit': company.nit,
  });
  String result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}
