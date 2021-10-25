import 'dart:convert';
import 'dart:developer';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

class CallPanic {
  Future<bool> Call_Number() async {
    try {
      String num = GetListNumbers().first;
      FlutterPhoneDirectCaller.directCall(num);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  /*void SendSmsPanic() async {
    try {
      List<String> numbers = GetListNumbers();
      String message = "Este Telefono Envio Alerta Desde un Taxi";
      String result = await sendSMS(message: message, recipients: numbers);
      log(result);
    } catch (e) {
      log(e.toString());
    }
  }*/

  Future<bool> SendSms() async {
    SmsSender sender = new SmsSender();
    List<String> address = GetListNumbers();
    try {
      for (var x in address) {
        await sender.sendSms(new SmsMessage(
            x, "Este Telefono Envio Alerta Desde un Taxi de Placa XXXX-XXXX"));
      }
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  List<String> GetListNumbers() {
    List<String> numbers = ["69685120", "69685120"];
    return numbers;
  }

  Future<List<String>> GetListFromDB() async {
    Sessions sessions = Sessions();
    List<String> numbers = List.empty();
    bool googleSession = await sessions.verificationSession("emailGoogle");
    bool facebookSession = await sessions.verificationSession("emailFacebook");
    String idSession = "";
    if (facebookSession == true) {
      idSession = sessions.getSessionValue("idFacebook");
    } else if (googleSession == true) {
      idSession = sessions.getSessionValue("idGoogle");
    }
    try {
      var url = Service.url + "UserAdd/UserController.php";
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(
              {"idPerson": int.parse(idSession), "type": "GetListNumber"}));
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'];
    } catch (e) {
      log(e.toString());
      return List.empty();
    }
  }
}
