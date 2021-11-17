import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';

class EmergencyContactService {
  AuthService _authService = AuthService();

  /// Obtiene contactos de emergencia segun el id del usuario.
  Future<List<EmergencyContact>?> getEmergencyContacts() async {
    int userId = await _authService.getCurrentId();
    try {
      final queryParams = {
        'idClientUser': userId.toString(),
      };
      final uri = Uri.https(
        Server.host,
        '${Server.baseEndpoint}/emergencyContact/emergencyContact_controller.php',
        queryParams,
      );

      final response = await http.get(uri);
      return _contactsToList(response);
    } catch (e) {
      return null;
    }
  }

  /// Registra un contacto de emergencia en la base de datos.
  Future insertEmergencyContact(EmergencyContact emergencyContact) async {
    try {
      final url =
          '${Server.url}/emergencyContact/emergencyContact_controller.php';
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'idEmergencyContact': '',
          'nameContact': emergencyContact.nameContact,
          'number': emergencyContact.number,
          'idClientUser': emergencyContact.idClientUser.toString(),
        }),
      );

      final success = response.statusCode == 200;
      return success;
    } catch (e) {
      return false;
    }
  }

  /// Edita un contacto segun su id en la base de datos.
  Future<bool> updateEmergencyContact(EmergencyContact emergencyContact) async {
    try {
      final url =
          '${Server.url}/emergencyContact/emergencyContact_controller.php';
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode({
          "idEmergencyContact": emergencyContact.idEmergencyContact,
          "nameContact": emergencyContact.nameContact,
          "number": emergencyContact.number,
          "idClientUser": '',
        }),
      );

      final success = response.statusCode == 200;
      return success;
    } catch (e) {
      return false;
    }
  }

  /// Delete a emergency contact .
  Future deleteEmergencyContact(EmergencyContact emergencyContact) async {
    try {
      final url =
          '${Server.url}/emergencyContact/emergencyContact_controller.php';
      final response = await http.delete(
        Uri.parse(url),
        body: jsonEncode({
          "idEmergencyContact": emergencyContact.idEmergencyContact,
          "nameContact": '',
          "number": '',
          "idClientUser": '',
        }),
      );

      final success = response.statusCode == 200;
      return success;
    } catch (e) {
      print("  2 msgError: " + e.toString());
      return false;
    }
  }

  List<EmergencyContact> _contactsToList(http.Response response) {
    List<dynamic> body = jsonDecode(response.body);
    List<EmergencyContact> contacts =
        body.map((e) => EmergencyContact.fromJson(e)).toList();

    return contacts;
  }
}
