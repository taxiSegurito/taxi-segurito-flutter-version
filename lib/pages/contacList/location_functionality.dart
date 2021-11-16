import 'dart:convert';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/models/emergencycontact.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/server.dart';

class LocationFunctionality {
  Future<List<EmergencyContact>> getContacts() async {
    AuthService _authService = AuthService();
    final clientId = await _authService.getCurrentId();
    final queryParams = {'idClientUser': clientId.toString()};
    final uri = Uri.https(
        Server.host,
        Server.baseEndpoint +
            "/emergencyContact/emergencyContact_controller.php",
        queryParams);

    Response response = await get(uri);
    if (response.statusCode == 200) {
      return _jsonToList(response);
    }
    throw 'Unable to fetch Contacts data';
  }

  List<EmergencyContact> _jsonToList(Response response) {
    List<dynamic> body = jsonDecode(response.body);
    List<EmergencyContact> contacts =
        body.map((d) => EmergencyContact.fromJson(d)).toList();
    return contacts;
  }
}
