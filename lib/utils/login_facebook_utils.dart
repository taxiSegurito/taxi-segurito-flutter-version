import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/utils/servces.dart';
import 'admin_session_for_.social_networks.dart';

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
        String exits = await Services().GetCellphoneIfExists(email);
        if (exits != "Error") {
          Clientuser clientExits = Clientuser.InsertForGoogleAndFacebook(
              "Facebook", fullName, cellphone = exits, email, "Facebook");
          AdminSession().AddSession(clientExits);
          return clientExits;
        }
        //Cuando No exista el usuario en la BD se le debera pedir el numero de telefono
        return client;
      }
    } else {
      return null;
    }
  }
}
