import 'dart:developer';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:sms/sms.dart';

class CallPanic {
  void Call_Number() async {
    String num = "71817190";
    //FlutterPhoneDirectCaller.callNumber(num);
    FlutterPhoneDirectCaller.directCall("67392338");
  }

  void SendSmsPanic() async {
    try {
      List<String> numbers = GetListNumbers();
      String message = "Este Telefono Envio Alerta Desde un Taxi";
      String result = await sendSMS(message: message, recipients: numbers);
      log(result);
    } catch (e) {
      log(e.toString());
    }
  }

  void SendSms() async {
    SmsSender sender = new SmsSender();
    List<String> address = GetListNumbers();
    for (var x in address) {
      await sender.sendSms(
          new SmsMessage(x, "Este Telefono Envio Alerta Desde un Taxi"));
    }
  }

  List<String> GetListNumbers() {
    List<String> numbers = ["69685120", "71817190"];
    return numbers;
  }
}
