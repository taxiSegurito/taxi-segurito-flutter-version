import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'sessions_service.dart';

class AuthService {
  late SessionsService _sessionsService;

  AuthService() {
    _sessionsService = SessionsService();
  }

  Future<User?> logIn(User user) async {
    User? userRes = await _getUser(user);
    if (userRes != null) {
      await _saveSession(userRes);
    }

    return userRes;
  }

  Future<bool> logOut() async {
    final success = await _deleteSession();
    return success;
  }

  _saveSession(User user) async {
    await _sessionsService.addSessionValue('id', user.idPerson.toString());
    await _sessionsService.addSessionValue('role', user.role);
    await _sessionsService.addSessionValue('name', user.fullName);
  }

  Future<bool> _deleteSession() async {
    bool id = await _sessionsService.verificationSession('id');
    bool role = await _sessionsService.verificationSession('role');
    bool name = await _sessionsService.verificationSession('name');
    if (id && role && name) {
      _sessionsService.removeValuesSession('id');
      _sessionsService.removeValuesSession('role');
      _sessionsService.removeValuesSession('name');
      return true;
    }
    return false;
  }
}

Future<User?> _getUser(User user) async {
  final queryParams = {'email': user.email, 'password': user.password};
  final endpoint = Uri.http(
    Server.host,
    "${Server.baseEndpoint}/auth/auth_controller.php",
    queryParams,
  );

  final response = await http.get(endpoint);
  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    return new User.logInResponse(body['id'], body['role'], body['name']);
  }

  return null;
}
