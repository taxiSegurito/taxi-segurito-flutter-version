import 'dart:developer';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sms_advanced/sms_advanced.dart';

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
}
