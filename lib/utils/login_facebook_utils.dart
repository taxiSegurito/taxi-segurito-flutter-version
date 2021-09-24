import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginFacebookUtils {
  //LoginWithFacebook
  Future<bool> LoginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    log("Paso" + result.message.toString());
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      log("Facebook" + accessToken.userId);
    }
    log("Mensaje" + result.status.toString());
    return result.status == LoginStatus.success;
  }
}
