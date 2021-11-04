import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

class ListContact_Functionality{

  Sessions sessions = Sessions(); 
  var idUser = '0';
  var dataSet;
  //Link database
  //var db ="https://taxi-segurito.000webhostapp.com/flutter_api/";
  final db ="https://taxi-segurito.herokuapp.com/";
  final path = "api/emergencyContact/";
  Future CheckID() async
  {
    bool isSession = await sessions.verificationSession("iduser");
    print("___CHECK ID___");
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

  // 1 SELECT query: Get all user's emergency contacts at init widget
  Future SelectContactData() async
  {
    List<dynamic> data;
    final queryParameters = {
      'id': idUser,
      };
    try
    {
      print("___SelectContactData query___");
      final uri = Uri.https("taxi-segurito.herokuapp.com", path+"emergencyContact_controller.php", queryParameters);
      final response = await http.get(uri);
      print("1 query_result: "+response.body);
      data = jsonDecode(response.body);
      return data;
    }catch(e)
    {
      print("2 msgError: "+e.toString());
      return "NoResponse";
    }
    
  }
  
  // 2 HARD DELETE: realize a DELETE.
  Future DeleteHardContact(String _id) async
  {
    String data;
    final queryParameters = {
      'id': idUser,
      };
    try
    {
      print("___DeleteSoftUser query___");
      final url = db+path+"emergencyContact_controller.php";
      final response = await http.delete(Uri.parse(url),body:{
        "id" : _id,
      });

      print("1 query_result: "+response.body);
      data = jsonDecode(response.body) ;
    }catch(e)
    {
      print("2 msgError: "+e.toString());
      return "NoResponse";
    }
    return data;
  }



  // UI FUNCTIONS

  // 1 Function: DeleteButton function
  void DeleteContact_Function(_idEmergencyContact,context) async
  {
    String result =await DeleteHardContact(_idEmergencyContact.toString());

    if(result=="success")
    {
      ShowCustomToast("Se ha borrado el contacto.", Colors.green);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => ListContact_Page()),);
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