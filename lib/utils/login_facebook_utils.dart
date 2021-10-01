import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/client.dart';
import 'package:taxi_segurito_app/models/sesion.dart';

class LoginFacebookUtils {
  FacebookAuth facebookAuth = FacebookAuth.i;

  //LoginWithFacebook
  Future<Client?> LoginWithFacebook() async {
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
        bool controlBD;
        Client client = Client(fullName, email, cellphone);
        //CheckExits retorna numero si existe
        //retorna Error si no existe
        String exits = await CheckExits(email);
        if (exits != "Error") {
          Client clientExits = Client(fullName, email, cellphone = exits);
          AddSession(clientExits);
          return clientExits;
        }
        if (client.cellphone != "") {
          controlBD = await AddDataFacebook(client);
          if (controlBD == true) {
            client = new Client(fullName, email, cellphone);
            return client;
          }
        } else {
          return client;
        }
      }
    } else {
      return null;
    }
  }

  //Method that sends data to backend
  //Solo debe ser llamado cuando esten los datos completos
  Future<bool> AddDataFacebook(Client client) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      bool control;
      var response = await http.put(Uri.parse(url),
          body: jsonEncode({
            "email": client.email,
            "password": "Facebook", //por defecto
            "fullName": client.fullName,
            "cellphone": client.cellphone,
            "typeRegister": "Facebook",
            "idrole": 2, //Cliente
          }));
      var res = jsonDecode(response.body);
      if (res == "Registro Nuevo") {
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

  void AddSession(Client client) async {
    Sessions sessions = new Sessions();
    await sessions.addSessionValue("emailFacebook", client.email);
  }

  //Verifica que exista en la base de datos
  //return cellphone si existe
  //return Error si no
  Future<String> CheckExits(String email) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": email,
          }));
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'].toString();
    } catch (e) {
      log(e.toString());
      return "Error";
    }
  }
}
