import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/user.dart';
class UserService {

  Future<String> getIdByEmail(String email) async {
    try {
      final queryParams = {
        'email': email,
        'expectedResponse': 'id',
      };

      final endpoint = Uri.http(
        Server.host,
        "${Server.baseEndpoint}/user/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result['id'].toString();
      }

      return 'error';
    } catch (exception) {
      return 'error';
    }
  }

  Future updatePasswordByEmail(String email, String password) async {
    try {
      var path = "${Server.url}/user/user_controller.php";
      final response = await http.put(
        Uri.parse(path),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print("error: " + e.toString());
      return false;
    }
  }

  Future getUserById(idClientUser) async {
    try {
      final queryParams = {
        'id': idClientUser.toString(),
        'expectedResponse': 'clientUser',
      };

      final endpoint = Uri.http(
        Server.host,
        "${Server.baseEndpoint}/user/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result['result'];
      }

      return 'error';
    } catch (exception) {
      print("3 Error: "+exception.toString());
      return 'error';
    }
  }

  ///updates data user
  Future updateUser(User user) async
  {
    try {
      var path = "${Server.url}/user/user_controller.php";
      final response = await http.put(
        Uri.parse(path),
        body: jsonEncode({
        'idPerson': user.idPerson.toString(),
        'fullname': user.fullName,
        'cellphone': user.cellphone,
        }),
      );
      print("  response: "+response.body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;

    } catch (exception) {
      print(" updateUser Error: "+exception.toString());
      return false;
    }
  }

  /// realize a UPDATE, status = 0
  Future deleteUser(User user) async
  {
    try {
      var path = "${Server.url}/user/user_controller.php";
      final response = await http.delete(
        Uri.parse(path),
        body: jsonEncode({
        'idPerson': user.idPerson.toString(),
        }),
      );
      print("  response: "+response.body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;

    } catch (exception) {
      print(" deleteUser Error: "+exception.toString());
      return false;
    }
  }
}