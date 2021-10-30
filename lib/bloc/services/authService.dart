import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/services/Server.dart';

Future<List<dynamic>> login(User user) async {
  final queryParams = {'email': user.email, 'password': user.password};
  final endpoint = Uri.http(
    Server.host,
    "${Server.baseEndpoint}/auth/login.php",
    queryParams,
  );

  final response = await http.get(endpoint);
  final body = json.decode(response.body);

  if (body != "error") {
    return body;
  }
  return [];
}
