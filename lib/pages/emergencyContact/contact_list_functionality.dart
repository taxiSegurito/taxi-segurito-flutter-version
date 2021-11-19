import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';

class ListContactFunctionality {
  SessionsService sessions = SessionsService();
  String idUser = "0";
  var dataSet;
  //Link database
  //var db ="https://taxi-segurito.000webhostapp.com/flutter_api/";
  var db = "https://taxi-segurito.000webhostapp.com/flutter_api/";

  Future CheckID() async {
    bool idsession = await sessions.verificationSession("id");
    print("-1: " + idUser);
    if (idsession) {
      idUser = sessions.getSessionValue("id").toString();
      print("0: " + idUser);
      return true;
    }
    return false;
  }

  //Querys

  // 1 SELECT query: Get all user's contacts  at init widget
  Future SelectContactData() async {
    List<dynamic> data;
    var url = db + "selectEmergencyContact.php";
    try {
      var response = await http.post(Uri.parse(url), body: {
        "id": idUser,
      });
      print("_SelectContactData query_");
      print("1: " + response.body);
      data = jsonDecode(response.body); //response.body returns String
    } catch (e) {
      print("1.5: " + e.toString());
      return "NoResponse";
    }
    return data;
  }

  // 3 UPDATE query: updates data user
  /*
  Future UpdateUserData(String _id, String _fullname,String _cellphone,String _email) async
  {
    var url = db+"updateUser.php";
    var response = await http.post(Uri.parse(url),body:{
      "id" : _id,
      "fullname" : _fullname,
      "cellphone" : _cellphone,
      "email" : _email,
    });
    print("_UpdateUserData query_");
    print("1: "+response.body);
    //User user = User.fromJson(json.decode(response.body)) ;
    String data = response.body;
    print("2: "+data);
    return data;
  }
  */
  // 4 SOFT DELETE: realize a UPDATE, status = 0
  Future deleteHardContact(String _id) async {
    var url = db + "deleteEmergencyContact.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": _id,
    });
    print("_DeleteSoftUser query_");
    print("1: " + response.body);
    //User user = User.fromJson(json.decode(response.body)) ;
    String data = response.body;
    print("2: " + data);
    return data;
  }

  // UI FUNCTIONS
  // Function init

/*
  void EditContact_Function() async
  {
    String result =await UpdateUserData(idUser, nombreCompleto_Controller.text, cellphone_Controller.text, email_Controller.text);

    if(result=="Success") {ShowCustomToast("Se han guardado los cambios.", Colors.green);}
    else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}
  }
*/
/*
  void DeleteContact_Function() async
  {
    String result =await DeleteHardContact(id);

    if(result=="Success")
    {
      ShowCustomToast("Se ha desactivado la cuenta.", Colors.green);
    }
    else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}
  }
  */

  void showCustomToast(String myText, Color myColor) {
    Fluttertoast.showToast(
        msg: myText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: myColor,
        textColor: Colors.white);
  }
}
