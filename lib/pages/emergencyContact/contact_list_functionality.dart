import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/emergency_contact_service.dart';

class ListContact_Functionality{

  SessionsService sessions = SessionsService();
  EmergencyContactService emergencyContactService = new EmergencyContactService();
  int sessionId = 0;
  bool isSession = false;
  
  List<EmergencyContact> contacts = [];
  
  Future CheckSession() async
  {
    try
    {
      bool isSession = await sessions.verificationSession("id");
      if (isSession)
      {
        var iduser = await sessions.getSessionValue("id");
        sessionId = int.parse(iduser);
        print(sessionId.toString());
        return true;
      }
      else return false;
    }catch(e)
    {
      print("  2 msgError: "+e.toString());
      return false;
    }
  }

 Future loadData() async
 {
  isSession = await CheckSession();
  print(isSession);
  if(isSession)
    {
      var dataSet = await emergencyContactService.getEmergencyContactsByIdUser(new EmergencyContact.getByIdUser(sessionId));
      print("  2 dataSet: "+dataSet.toString());
      if(dataSet.toString()!="NoResponse" && dataSet.toString() != "Error")
      {
        if(dataSet!=[])
        {
          contacts.clear();
          for(var a in dataSet)
          {
            EmergencyContact aux = EmergencyContact.fromJson(a);
            contacts.add(aux);
          }
        } 
        else{
          ShowCustomToast("No se han encontrado los datos del usuario.", Colors.red);
        }
      }
      else
      {
        ShowCustomToast("Error en la base de datos.", Colors.red);
      }
    }
  }

  void DeleteContact_Function(idEmergencyContact,context) async
  {
    bool result = await emergencyContactService.deleteEmergencyContact(new EmergencyContact.delete(idEmergencyContact));

    if(result)
    {
      ShowCustomToast("Se ha borrado el contacto.", Colors.green);
    }
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
