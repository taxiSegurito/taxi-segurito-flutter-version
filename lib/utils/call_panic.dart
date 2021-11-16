import 'dart:developer';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/services/emergency_contact_service.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';

class CallPanic {
  Future<bool> callNumber() async {
    try {
      List<EmergencyContact> emergency = List.empty();
      emergency = (await getListNumbers())!;
      String num = getListNumberAsString(emergency)!.first;
      if (num != null) {
        FlutterPhoneDirectCaller.directCall(num);
        return true;
      } else {
        FlutterPhoneDirectCaller.directCall("911");
        return true;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> sendSms() async {
    SmsSender sender = new SmsSender();
    List<EmergencyContact> emergency = List.empty();
    emergency = (await getListNumbers())!;
    List<String>? address = getListNumberAsString(emergency);
    try {
      if (address != null) {
        for (var x in address) {
          await sender.sendSms(new SmsMessage(
              x, "Este Telefono Envio Alerta Desde un Taxi de Placa"));
        }
        return true;
      } else {
        await sender.sendSms(new SmsMessage(
            "911", "Este Telefono Envio Alerta Desde un Taxi de Placa"));
        return true;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> btnpanic() async {
    try {
      bool controlSms = false, controlCall = false;
      await CallPanic().sendSms().then((value) => {
            if (value == true) {controlSms = value}
          });
      await CallPanic().callNumber().then((value) => {
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

  Future<List<EmergencyContact>?> getListNumbers() async {
    SessionsService sessions = new SessionsService();
    List<EmergencyContact> contacts = [];
    int sessionId = 0;
    var iduser = await sessions.getSessionValue("id");
    sessionId = int.parse(iduser);
    EmergencyContactService emergencyContactService =
        new EmergencyContactService();
    var dataSet = await emergencyContactService.getEmergencyContactsByIdUser(
        new EmergencyContact.getByIdUser(sessionId));
    if (dataSet.toString() != "Error") {
      if (dataSet != []) {
        contacts.clear();
        for (var a in dataSet) {
          EmergencyContact aux = EmergencyContact.fromJson(a);
          contacts.add(aux);
        }
        return contacts;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  List<String>? getListNumberAsString(List<EmergencyContact> contacts) {
    List<String> numbers = new List.empty();
    if (contacts != null) {
      for (var c in contacts) {
        numbers.add(c.number);
      }
      return numbers;
    } else {
      return null;
    }
  }
}
