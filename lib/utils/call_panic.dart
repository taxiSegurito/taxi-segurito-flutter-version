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

  Future<bool> btnpanic() async {
    try {
      bool controlSms = false, controlCall = false;
      await CallPanic().SendSms().then((value) => {
            if (value == true) {controlSms = value}
          });
      await CallPanic().Call_Number().then((value) => {
            if (value == true) {controlCall = value}
          });
      if (controlSms == true && controlCall == true) {
        log("Se Ejecuta");
        return true;
      } else {
        log("Hubo Algun Fallo");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
