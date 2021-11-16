import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/emergency_contact_service.dart';

class ContactFormFunctionality {
  SessionsService sessions = SessionsService();
  EmergencyContactService emergencyContactService =
      new EmergencyContactService();
  bool isSession = false;
  int sessionId = 0;

  //UI data controllers
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  checkSession() async {
    try {
      bool isSession = await sessions.verificationSession("id");
      if (isSession) {
        var iduser = await sessions.getSessionValue("id");
        sessionId = int.parse(iduser);
        print("sessionId: " + sessionId.toString());
      }
    } catch (e) {
      print("  2 msgError: " + e.toString());
    }
  }

  void onPressedBtnAgregarContacto(BuildContext context) async {
    if (contactNumberController.text.length != 8) {
      showCustomToast("Ingrese un número de 8 dígitos", Colors.red);
    } else {
      print("LA SESION ID: " + sessionId.toString());
      bool result = await emergencyContactService.insertEmergencyContact(
          new EmergencyContact.insert(contactNameController.text,
              contactNumberController.text, sessionId));

      if (result) {
        showCustomToast("Se han guardado los cambios.", Colors.green);
        Navigator.pop(context);
      } else {
        showCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);
      }
    }
  }

  void onPressedBtnEditarContact(
      BuildContext context, idEmergencyContact) async {
    bool result = await emergencyContactService.updateEmergencyContact(
        new EmergencyContact.update(idEmergencyContact,
            contactNameController.text, contactNumberController.text));

    if (result) {
      showCustomToast("Se han guardado los cambios.", Colors.green);
      Navigator.pop(context);
    } else {
      showCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);
    }
  }

  void showCustomToast(String myText, Color myColor) {
    Fluttertoast.showToast(
        msg: myText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: myColor,
        textColor: Colors.white);
  }
}
