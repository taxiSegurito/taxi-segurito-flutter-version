import 'dart:convert';
import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class LoginFacebookUtils {
  FacebookAuth facebookAuth = FacebookAuth.i;

  //LoginWithFacebook
  Future<bool> LoginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_gender'],
    );
    var userData = await FacebookAuth.instance
        .getUserData(fields: "name,email,picture.width(200),gender");
    log(userData.entries.first.value);
    log(userData.entries.last.value);
    log(userData.toString());
    log(userData["email"].toString());

    log("Paso" + result.message.toString());
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      log("Facebook" + accessToken.userId);
    }
    log("Mensaje" + result.status.toString());
    log(result.status.toString());
    AddDataFacebook(userData.entries.first.value, userData["email"].toString());
    return result.status == LoginStatus.success;
  }

  void AddDataFacebook(String fullName, String email) async {
    var url =
        await "https://taxi-segurito.000webhostapp.com/flutter_api/UserAdd/UserController.php";

    log(fullName + "-  http");
    var response = await http.put(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "password": "Facebook", //por defecto
          "fullName": fullName,
          "cellphone": "12345678",
          "typeRegister": "Facebook",
          "idrole": 2, //Cliente
        }));
    log(response.body);
  }
}
