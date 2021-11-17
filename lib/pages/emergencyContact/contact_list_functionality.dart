import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/emergency_contact_service.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_form_page.dart';

class ListContactFunctionality {
  AuthService _authService = AuthService();
  SessionsService sessions = SessionsService();
  EmergencyContactService emergencyContactService =
      new EmergencyContactService();

  int currentUserId = 0;
  bool isSession = false;

  late BuildContext context;
  ListContactFunctionality(this.context);
  List<EmergencyContact> contacts = [];

  Future<bool> checkSession() async {
    try {
      bool isSession = await sessions.verificationSession("id");
      if (isSession) {
        currentUserId = await _authService.getCurrentId();
        return true;
      }

      return false;
    } catch (e) {
      print("CheckSession msgError: " + e.toString());
      return false;
    }
  }

  void loadData() async {
    final isSession = await checkSession();
    if (isSession) {
      List<EmergencyContact>? contacts =
          await emergencyContactService.getEmergencyContacts();

      if (contacts != null) {
        this.contacts = contacts;
      } else {
        showToast("Error en la base de datos.", Colors.red);
      }
    }
  }

  onPressedFloatingButton() {
    Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => ContactFormPage.insert()),
    );
  }

  onTapEditIcon(contact) {
    Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => ContactFormPage.update(contact)),
    );
  }

  deleteContact(idEmergencyContact) async {
    bool result = await emergencyContactService.deleteEmergencyContact(
        new EmergencyContact.delete(idEmergencyContact));

    if (result) {
      showToast("Se ha borrado el contacto.", Colors.green);
    } else {
      showToast("Error, inténtelo de nuevo mas tarde...", Colors.red);
    }
  }

  void showToast(String myText, Color myColor) {
    Fluttertoast.showToast(
        msg: myText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: myColor,
        textColor: Colors.white);
  }
}
