import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class DriversService {
  String host = "10.0.3.2:8086";

  Future<List<Driver>> getByOwner() async {
    String endpoint = "http://" + host + "/driver_controller.php";
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Driver> drivers = body.map((d) => Driver.fromJson(d)).toList();
      return drivers;
    } else {
      throw "Unable to fetch drivers data";
    }
  }

  Future<List<Driver>> getByCriteria(String criteria) async {
    final queryParams = {'criteria': criteria};
    final uri = Uri.http(host, '/driver_controller.php', queryParams);
    Response response = await get(uri);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Driver> drivers = body.map((d) => Driver.fromJson(d)).toList();
      return drivers;
    } else {
      throw "Unable to fetch drivers data";
    }
  }
}
