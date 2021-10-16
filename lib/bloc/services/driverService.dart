import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';

class DriverService {
  static const ADD_URL = Service.url + "crearDriver.php";

  Future<String> addDriver(Driver driverModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: driverModel.jsonModel());
    if (response.statusCode == 200) {
      print("add Respopnse : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
