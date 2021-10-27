import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/utils/servces.dart';

class AdminSession {
  Sessions sessions = new Sessions();
  void AddSession(Clientuser client) async {
    String Id = await Services().GetId(client.email);
    await sessions.addSessionValue("iduser", Id);
    await sessions.addSessionValue("rol", "Cliente");
  }

  Future<bool> DeleteSession() async {
    bool idsession = await sessions.verificationSession("iduser");
    bool rolsession = await sessions.verificationSession("rol");
    if (idsession && rolsession) {
      sessions.removeValuesSession("iduser");
      sessions.removeValuesSession("rol");
      return true;
    } else {
      return false;
    }
  }
}
