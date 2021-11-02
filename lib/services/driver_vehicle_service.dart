import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:http/http.dart' as http;

class DriverVehicleService {
  Future<Map<String, dynamic>?> getDriverAndVehicleByPleik(String pleik) async {
    final queryParams = {'pleik': pleik};
    final endpoint = Uri.http(
      Server.host,
      '${Server.baseEndpoint}/driver_has_vehicle/driverhv_controller.php',
      queryParams,
    );

    Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return {
        'idDriverHasVehicle': body['idDriverHasVehicle'] as int,
        'driver': Driver.fromJson(body['driver']),
        'vehicle': Vehicle.fromJson(body['vehicle'])
      };
    }
    return null;
  }
}
