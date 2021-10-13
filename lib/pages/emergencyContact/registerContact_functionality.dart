import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

class RegisterContact_Functionality{

  Sessions sessions = Sessions(); 
  String idUser = "1";
  var dataSet;
  //Link database
  var db ="https://192.168.0.13/flutter_api/";
  //UI data controllers
  TextEditingController contactName_Controller = TextEditingController();
  TextEditingController contactNumber_Controller = TextEditingController();
  /*
  String nombreCompleto = 'Invitado';
  String cellphone = '-';
  String email = '-';
*/

  //Querys

  // 1 GET query: Get data user at init widget
  /*
  Future GetContactData(String _id) async
  {
    var contact;
    var url = db+"getEmergencyContacts.php";
    try
    {
      var response = await http.post(Uri.parse(url),body:{
        "id" : _id,
    });
      print("_GetContactData query_");
      print("1: "+response.body);
      //User user = User.fromJson(json.decode(response.body)) ;
      String data = response.body; //response.body returns String
      contact = data.split(','); // data = "data1,data2,data3"
      print("2: "+contact.toString());
    }catch(e)
    {
      return "NoResponse";
    }
    return contact;
  }
  */
  // 2 INSERT query: register emergency contact
  Future InsertEmergencyContact(String _id, String _nameContact,String _number) async
  {
    var url = db+"insertEmergencyContact.php";
    String data = "";
    try
    {
    var response = await http.post(Uri.parse(url),body:{
      "id" : _id,
      "nameContact" : _nameContact,
      "number" : _number,
    });
    print("_InsertEmergencyContact query_");
    print("1: "+response.body);
    //User user = User.fromJson(json.decode(response.body)) ;
    data = response.body;
    print("2: "+data);
    }
    catch(e) {
      //ShowCustomToast("No se pudo conectar con el servidor...", Colors.red);
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
  Future DeleteHardContact(String _id) async
  {
    var url = db+"deleteEmergencyContact.php";
    var response = await http.post(Uri.parse(url),body:{
      "id" : _id,
    });
    print("_DeleteSoftUser query_");
    print("1: "+response.body);
    //User user = User.fromJson(json.decode(response.body)) ;
    String data = response.body;
    print("2: "+data);
    return data;
  }



  // UI FUNCTIONS
  // Function init
/*
  void SelectData_Function() async
  {
    dataSet = await GetContactData(idUser);
    print("3: "+dataSet.toString());
    if(dataSet.toString()=="NoResponse")
    {
      ShowCustomToast("Error al conectar con la base de datos.", Colors.red);
    }
    else{
    //nombreCompleto_Controller.text = dataUser[0];
    //cellphone_Controller.text = dataUser[1];
    //email_Controller.text = dataUser[2];
    
    }

  }
*/
 void InsertContact_Function(BuildContext context) async
 {
    String result =await InsertEmergencyContact(idUser, contactName_Controller.text, contactNumber_Controller.text);

    if(result=="Success") {ShowCustomToast("Se han guardado los cambios.", Colors.green);Navigator.pop(context);}
    else {ShowCustomToast("Error, inténtelo de nuevo mas tarde...", Colors.red);}
 }
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
  void CheckID() async
  {
    bool idsession = await sessions.verificationSession("iduser");
    if (idsession)
    {
      idUser = sessions.getSessionValue("iduser").toString();
    }
     print("0: "+idUser);
     //GetData_Function();
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
