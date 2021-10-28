import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/utils/admin_session_for_.social_networks.dart';
import 'package:taxi_segurito_app/utils/servces.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  //GOOGLE Methods
  //SignInWithGoogle
  Future<Clientuser?> signUpWithGoogle() async {
    try {
      //Log in Start
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      //If the login was correct it will be different from null
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        String fullName = user!.displayName.toString();
        String email = user!.email.toString();
        String cellphone = user!.phoneNumber.toString();
        Clientuser client = Clientuser.InsertForGoogleAndFacebook(
            "Google", fullName, cellphone, email, "Google");
        bool controlBD;
        String exits = await Services().getCellphoneIfExists(email);
        //Ya existe
        if (exits != "Error") {
          Clientuser clientUser = Clientuser.InsertForGoogleAndFacebook(
              "Google", fullName, cellphone = exits, email, "Google");
          AdminSession().AddSession(clientUser);
          return clientUser;
        }
        //En caso de que haya un numero
        if (client.cellphone != "null") {
          controlBD = await Services().addData(client);
          if (controlBD == true) {
            return client;
          } else if (controlBD == false) {
            return null;
          }
        }
        //In case there is no number, the backend will not be called yet
        else {
          return client;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> LogOutGoogle() async {
    await googleSignIn.signOut();
  }
}
