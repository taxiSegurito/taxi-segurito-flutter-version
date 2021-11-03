import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'server.dart';

class DriversService {
  AuthService _authService = AuthService();

  Future<List<Driver>> getByOwner() async {
    final ownerId = await _authService.getCurrentId();
    final queryParams = {'ownerId': ownerId.toString()};
    final endpoint = Uri.http(
      Server.host,
      '${Server.baseEndpoint}/driver/driver_controller.php',
      queryParams,
    );

    Response response = await get(endpoint);
    if (response.statusCode == 200) {
      return _jsonToList(response);
    }
    throw 'Unable to fetch drivers data';
  }

  Future<List<Driver>> getByCriteria(String criteria) async {
    final ownerId = await _authService.getCurrentId();
    final queryParams = {
      'criteria': criteria,
      'ownerId': ownerId.toString(),
    };
    final endpoint = Uri.http(
      Server.host,
      '${Server.baseEndpoint}/driver/driver_controller.php',
      queryParams,
    );

    Response response = await get(endpoint);
    if (response.statusCode == 200) {
      return _jsonToList(response);
    }
    throw 'Unable to fetch drivers data';
  }

  Future<bool> update(Driver driver) async {
    return false;
  }

  List<Driver> _jsonToList(Response response) {
    List<dynamic> body = jsonDecode(response.body);
    List<Driver> drivers = body.map((d) => Driver.fromJson(d)).toList();
    return drivers;
  }
}
