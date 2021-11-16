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
      } else
        return false;
    } catch (e) {
      print("CheckSession msgError: " + e.toString());
      return false;
    }
  }

  Future loadData() async {
    final isSession = await checkSession();
    print(isSession);
    if (isSession) {
      var dataSet = await emergencyContactService.getEmergencyContactsByIdUser(
          new EmergencyContact.getByIdUser(currentUserId));
      if (dataSet.toString() != "Error") {
        if (dataSet != []) {
          contacts.clear();
          for (var a in dataSet) {
            EmergencyContact aux = EmergencyContact.fromJson(a);
            contacts.add(aux);
          }
        } else {
          showCustomToast(
              "No se han encontrado los datos del usuario.", Colors.red);
        }
      } else {
        showCustomToast("Error en la base de datos.", Colors.red);
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
      showCustomToast("Se ha borrado el contacto.", Colors.green);
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
