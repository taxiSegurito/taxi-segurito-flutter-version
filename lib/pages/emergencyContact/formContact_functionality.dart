import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

class FormContact_Functionality{

  Sessions sessions = Sessions(); 
  var idUser = "0"; // Inicializa como 'invitado', con CheckID() se actualiza la sesion.

  //Link database
  //var db ="https://taxi-segurito.000webhostapp.com/flutter_api/";
  //https://taxi-segurito.herokuapp.com/
  final db ="https://taxi-segurito.herokuapp.com/"; // "https://192.168.0.14/";
  final path = "api/emergencyContact/";// "taxisegu/app/api/emergencyContact/";
  //UI data controllers
  TextEditingController contactName_Controller = TextEditingController();
  TextEditingController contactNumber_Controller = TextEditingController();

  Future CheckID() async
  {
    bool isSession = await sessions.verificationSession("iduser");
    print("___CHECK ID____");
    print("0 isSession: "+isSession.toString());
    if (isSession)
    {
      var iduser = await sessions.getSessionValue("iduser");
      print("1 iduser: "+iduser.toString());
      idUser = iduser;
      return true;
    }
    else return false;
  }
  //Querys
  // 1 INSERT query: register emergency contact
  Future InsertEmergencyContact(String _id, String _nameContact,String _number) async
  {
    final uri = db+path+"emergencyContact_controller.php";
    String data = "";
    try
    {
    print("___InsertEmergencyContact query___");
    final response = await http.post(Uri.parse(uri),body:{
      "nameContact" : _nameContact,
      "number" : _number,
      "idclientuser" : _id,
    });
    
    print("1 query_result: "+response.body);
    data = jsonDecode(response.body) ;
    }
    catch(e) {
      print("2 msgError: "+e.toString());
      return "NoResponse";
    }

    return data;
  }

  // 2 UPDATE query: updates emergency contact
  Future UpdateContactData(String _id, String _nameContact,String _number) async
  {
    final uri = db+path+"emergencyContact_controller.php";
    String data ="";
    try
    {
      print("___UpdateUserData query___");
      final response = await http.put(Uri.parse(uri),body:{
        "id" : _id,
        "nameContact" : _nameContact,
        "number" : _number,
      });
      print("1 query_result: "+response.body);
      data = jsonDecode(response.body) ;
    }
    catch(e) {
      print("2 msgError: "+e.toString());
      return "NoResponse";
    }

    return data;
  }
  


  // UI FUNCTIONS
 //1 Function UI: BOTON Agregar contacto
 void InsertContact_Function(BuildContext context) async
 {
   if(contactNumber_Controller.text.length !=8) //Validator 1: Tamaño de contactNumber == 8
   {
      ShowCustomToast("Ingrese un número de 8 dígitos", Colors.red);
   }
   else
   {
     String result = await InsertEmergencyContact(idUser, contactName_Controller.text, contactNumber_Controller.text);

     if(result=="success") {ShowCustomToast("Se han guardado los cambios.", Colors.green);Navigator.pop(context);}
     else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}

   }

 }

 //2 Function UI: BOTON Editar contacto
  void EditContact_Function(BuildContext context, _idEmergencyContact) async
  {
    String result =await UpdateContactData(_idEmergencyContact.toString(), contactName_Controller.text,contactNumber_Controller.text);

    if(result=="success") {ShowCustomToast("Se han guardado los cambios.", Colors.green);Navigator.pop(context);}
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
