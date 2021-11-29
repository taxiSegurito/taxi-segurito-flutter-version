import 'dart:convert';
import 'package:taxi_segurito_app/models/emergencycontact.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:http/http.dart' as http;

class LocationFunctionality {
  Future<List<EmergencyContact>> getContacts() async {
    AuthService _authService = AuthService();
    final clientId = await _authService.getCurrentId();
    try {
      final queryParams = {
        'idClientUser': clientId.toString(),
      };
      final uri = Uri.http(
        Server.host,
        '${Server.baseEndpoint}/emergencyContact/emergencyContact_controller.php',
        queryParams,
      );

      final response = await http.get(uri);
      final success = response.statusCode == 200;
      if (success) {
        return _contactsToList(response);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  List<EmergencyContact> _contactsToList(http.Response response) {
    List<dynamic> body = jsonDecode(response.body);
    List<EmergencyContact> contacts =
        body.map((e) => EmergencyContact.fromJson(e)).toList();

    return contacts;
  }
}
