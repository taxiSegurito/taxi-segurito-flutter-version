import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/client.dart';

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
    if (userData != null) {
      String fullName = userData.entries.first.value;
      String email = userData["email"].toString();
      String cellphone = "2";
      bool controlBD = false;
      Client client = Client(fullName, email, cellphone);
      if (client.cellphone != "") {
        controlBD = await AddDataFacebook(client);
        if (controlBD == false) {
          return null;
        }
        return client;
      } else {
        return client;
      }
    } else {
      return null;
    }
  }

  //Method that sends data to backend
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
      if (response.body != '{"result":0}') {
        //Successful procedure
        control = true;
      } else {
        //failure
        control = false;
      }
      return control;
    } catch (e) {
      //if there is any uncontrolled error
      return false;
    }
  }
}
