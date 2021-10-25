import 'dart:convert';
import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';

class LoginFacebookUtils {
  FacebookAuth facebookAuth = FacebookAuth.i;

  //LoginWithFacebook
  Future<Clientuser?> LoginWithFacebook() async {
    // Authentication is executed request the required permissions
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );
    //The data is captured in userData
    var userData = await FacebookAuth.instance
        .getUserData(fields: "name,email,picture.width(200)");
    if (result.status == LoginStatus.success) {
      if (userData != null) {
        String fullName = userData.entries.first.value;
        String email = userData["email"].toString();
        String cellphone = "";
        Clientuser client = Clientuser.InsertForGoogleAndFacebook(
            "Facebook", fullName, cellphone, email, "Facebook");
        //CheckExits retorna numero si existe
        //retorna Error si no existe
        String exits = await GetCellphoneIfExists(email);
        if (exits != "Error") {
          Clientuser clientExits = Clientuser.InsertForGoogleAndFacebook(
              "Facebook", fullName, cellphone = exits, email, "Facebook");
          AddSession(clientExits);
          return clientExits;
        }
        //Cuando No exista el usuario en la BD se le debera pedir el numero de telefono
        return client;
      }
    } else {
      return null;
    }
  }

  //Method that sends data to backend
  //Solo debe ser llamado cuando esten los datos completos
  Future<bool> AddDataFacebook(Clientuser client) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      bool control;
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": client.email,
            "password": client.password,
            "fullName": client.fullName,
            "cellphone": client.cellphone,
            "typeRegister": client.registerType,
            "idrole": 2, //Cliente
            "type": "Insert"
          }));
      var res = jsonDecode(response.body);
      if (res['result'] == "Registro Nuevo") {
        control = true;
        AddSession(client);
      } else {
        //failure
        control = false;
      }
      return control;
    } catch (e) {
      //if there is any uncontrolled error
      log(e.toString());
      return false;
    }
  }

  void AddSession(Clientuser client) async {
    String idFacebook = await GetId(client.email);
    Sessions sessions = new Sessions();
    await sessions.addSessionValue("emailFacebook", client.email);
    await sessions.addSessionValue("cellphoneFacenook", client.cellphone);
    await sessions.addSessionValue("idFacebook", idFacebook);
  }

  //Verifica que exista en la base de datos
  //return cellphone si existe
  //return Error si no
  Future<String> GetCellphoneIfExists(String email) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({"email": email, "type": "GetCellphone"}));
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'].toString();
    } catch (e) {
      log(e.toString());
      return "Error";
    }
  }

  Future<String> GetId(String email) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({"email": email, "type": "GetId"}));
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'].toString();
    } catch (e) {
      log(e.toString());
      return "Error";
    }
  }
}
