import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/utils/login_google_utils.dart';

class LogOut {
  Future<bool> LogOutSession() async {
    try {
      bool control = false;
      Sessions sessions = Sessions();
      bool idsession = await sessions.verificationSession("iduser");
      bool rolsession = await sessions.verificationSession("rol");
      bool googleSession = await sessions.verificationSession("emailGoogle");
      bool facebookSession =
          await sessions.verificationSession("emailFacebook");
      if (idsession && rolsession) {
        sessions.removeValuesSession("iduser");
        sessions.removeValuesSession("rol");
        control = true;
      }
      if (googleSession) {
        sessions.removeValuesSession("emailGoogle");
        control = true;
      }
      if (facebookSession) {
        sessions.removeValuesSession("emailFacebook");
        control = true;
      }
      control = true;
      return control;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
