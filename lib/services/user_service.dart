import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/user.dart';

class UserService {
  Future<dynamic> getIdByEmail(String email) async {
    try{
      final queryParams = {'email': email,'expectedResponse': 'id',};
      final endpoint = Uri.http(
      Server.host,
        "${Server.baseEndpoint}/User/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result['result'];
      }
      return 'Error';
    } catch (exception) {
      return 'Error';
    }
}
Future updatePasswordByEmail(String email, String password) async {
  try {
    var path = "${Server.url}/User/user_controller.php";
    final response = await http.put(
      Uri.parse(path),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if(response.statusCode == 200)
    {
      return true;
    }
    if(response.statusCode == 503)
    {
      return false;
    }
    } 
    catch (e) {
      print("error: "+e.toString());
      return false;
    }
  }
}