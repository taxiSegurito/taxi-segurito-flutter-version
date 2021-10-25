import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class DriversService {
  String url = "http://10.0.3.2:8086/driver_controller.php";

  Future<List<Driver>> GetByOwner() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Driver> drivers = body.map((d) => Driver.fromJson(d)).toList();
      return drivers;
    } else {
      throw "Unable to fetch drivers data";
    }
  }
}
