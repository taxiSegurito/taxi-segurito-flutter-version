import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/emergency_contact_service.dart';

class FormContact_Functionality{

  SessionsService sessions = SessionsService(); 
  EmergencyContactService emergencyContactService = new EmergencyContactService();
  bool isSession = false;
  int sessionId = 0;

  //UI data controllers
  TextEditingController contactName_Controller = TextEditingController();
  TextEditingController contactNumber_Controller = TextEditingController();

  CheckSession() async
  {
    try
    {
      bool isSession = await sessions.verificationSession("id");
      if (isSession)
      {
        var iduser = await sessions.getSessionValue("id");
        sessionId = int.parse(iduser);
        print("sessionId: "+sessionId.toString());
      }
    }catch(e)
    {
      print("  2 msgError: "+e.toString());
    }
  }

 void onPressedBtnAgregarContacto(BuildContext context) async
 {
   if(contactNumber_Controller.text.length !=8)
   {
      ShowCustomToast("Ingrese un número de 8 dígitos", Colors.red);
   }
   else
   {
     print("LA SESION ID: "+sessionId.toString());
     bool result = await emergencyContactService.insertEmergencyContact(
       new EmergencyContact.insert(
         contactName_Controller.text, 
         contactNumber_Controller.text,
         sessionId
         ));

     if(result) {ShowCustomToast("Se han guardado los cambios.", Colors.green);Navigator.pop(context);}
     else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}

   }

 }

  void onPressedBtnEditarContact(BuildContext context, idEmergencyContact) async
  {
    bool result =await emergencyContactService.updateEmergencyContact(
      new EmergencyContact.update(
        idEmergencyContact,
        contactName_Controller.text,
        contactNumber_Controller.text));

    if(result) {ShowCustomToast("Se han guardado los cambios.", Colors.green);Navigator.pop(context);}
    else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}
  }

  void ShowCustomToast(String myText, Color myColor)
  {
        Fluttertoast.showToast(
        msg: myText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: myColor,
        textColor: Colors.white);
  }
  
}
