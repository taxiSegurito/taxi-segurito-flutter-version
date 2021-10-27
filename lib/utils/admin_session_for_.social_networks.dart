import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/utils/servces.dart';

class AdminSession {
  void AddSession(Clientuser client) async {
    String IdGoogle = await Services().GetId(client.email);
    Sessions sessions = new Sessions();
    await sessions.addSessionValue("emailGoogle", client.email);
    await sessions.addSessionValue("cellphoneGoogle", client.cellphone);
    await sessions.addSessionValue("idGoogle", IdGoogle);
  }
}
