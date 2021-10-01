import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/client.dart';
import 'package:taxi_segurito_app/models/sesion.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  //GOOGLE Methods
  //SignInWithGoogle
  Future<Client?> signUpWithGoogle() async {
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
      Client client = Client(fullName, email, cellphone);
      bool controlBD;
      String exits = await CheckExits(email);
      //Ya existe
      if (exits != "Error") {
        Client clientExits = Client(fullName, email, cellphone = exits);
        AddSession(clientExits);
        return clientExits;
      }
      //En caso de que haya un numero
      if (client.cellphone != "null") {
        controlBD = await AddDataGoogle(client);
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
  }

  //Method that sends data to backend
  Future<bool> AddDataGoogle(client) async {
    try {
      bool control = false;
      var url = Service.url + "UserAdd/UserController.php";
      var response = await http.put(Uri.parse(url),
          body: jsonEncode({
            "email": client.email,
            "password": "Google", //por defecto
            "fullName": client.fullName,
            "cellphone": client.cellphone,
            "typeRegister": "Google",
            "idrole": 2,
          }));
      var res = jsonDecode(response.body);
      if (res == "Registro Nuevo") {
        //The procedure was carried out successfully
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
    await sessions.addSessionValue("emailGoogle", client.email);
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
