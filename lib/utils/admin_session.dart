import 'dart:developer';
import 'package:taxi_segurito_app/models/client_user.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/utils/servces.dart';

class AdminSession {
  SessionsService sessions = new SessionsService();
  void addSession(Clientuser client) async {
    String id = await Services().getId(client.email);
    await sessions.addSessionValue("iduser", id);
    await sessions.addSessionValue("rol", "Cliente");
    log(await getSessionId() + " " + await getSessionRole());
  }

  Future<bool> deleteSession() async {
    bool idsession = await sessions.verificationSession("id");
    bool rolsession = await sessions.verificationSession("role");
    if (idsession && rolsession) {
      sessions.removeValuesSession('id');
      sessions.removeValuesSession('role');
      sessions.removeValuesSession('name');
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getSessionId() async {
    return await sessions.getSessionValue("id");
  }

  Future<String> getSessionRole() async {
    final role = await sessions.getSessionValue("role");
    return role.toString();
  }

  Future<dynamic> getSessionUsername() async {
    return await sessions.getSessionValue("name");
  }
}
