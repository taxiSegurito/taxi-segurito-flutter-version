import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class DriversService {
  String host = "taxi-segurito.herokuapp.com";

  Future<List<Driver>> getByOwner() async {
    String endpoint = "http://" + host + "/api/driver/driver_controller.php";
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return _jsonToList(response);
    }
    throw "Unable to fetch drivers data";
  }

  Future<List<Driver>> getByCriteria(String criteria) async {
    final queryParams = {'criteria': criteria};
    final endpoint =
        Uri.http(host, '/api/driver/driver_controller.php', queryParams);
    Response response = await get(endpoint);

    if (response.statusCode == 200) {
      return _jsonToList(response);
    }
    throw "Unable to fetch drivers data";
  }

  List<Driver> _jsonToList(Response response) {
    List<dynamic> body = jsonDecode(response.body);
    List<Driver> drivers = body.map((d) => Driver.fromJson(d)).toList();
    return drivers;
  }
}
