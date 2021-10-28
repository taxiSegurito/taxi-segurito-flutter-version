import 'dart:developer';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/utils/servces.dart';

class AdminSession {
  Sessions sessions = new Sessions();
  void addSession(Clientuser client) async {
    String Id = await Services().getId(client.email);
    await sessions.addSessionValue("iduser", Id);
    await sessions.addSessionValue("rol", "Cliente");
    log(await getSessionId() + " " + await getSessionRole());
  }

  Future<bool> deleteSession() async {
    bool idsession = await sessions.verificationSession("iduser");
    bool rolsession = await sessions.verificationSession("rol");
    if (idsession && rolsession) {
      sessions.removeValuesSession("id");
      sessions.removeValuesSession("role");
      sessions.removeValuesSession("name");
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getSessionId() async {
    return await sessions.getSessionValue("id");
  }

  Future<dynamic> getSessionRole() async {
    return await sessions.getSessionValue("role");
  }

  Future<dynamic> getSessionUsername() async {
    return await sessions.getSessionValue("name");
  }
}
