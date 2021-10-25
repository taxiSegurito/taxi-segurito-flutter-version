import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/bloc/services/env.dart';

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
        String exits = await GetCellphoneIfExists(email);
        //Ya existe
        if (exits != "Error") {
          Clientuser clientUser = Clientuser.InsertForGoogleAndFacebook(
              "Google", fullName, cellphone = exits, email, "Google");
          AddSession(clientUser);
          return clientUser;
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
    } catch (e) {
      return null;
    }
  }

  //Method that sends data to backend
  Future<bool> AddDataGoogle(Clientuser client) async {
    try {
      bool control = false;
      var url = Service.url + "UserAdd/UserController.php";
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": client.email,
            "password": client.password, //por defecto
            "fullName": client.fullName,
            "cellphone": client.cellphone,
            "typeRegister": client.registerType,
            "idrole": 2,
            "type": "Insert"
          }));
      var res = jsonDecode(response.body);
      if (res['result'] == "Registro Nuevo") {
        //The procedure was carried out successfully
        log("Entro?");
        control = true;
        AddSession(client);
      } else {
        //failure
        log(res['result']);
        control = false;
      }
      return control;
    } catch (e) {
      //if there is any uncontrolled error
      log(e.toString() + " Aqui ?");
      return false;
    }
  }

  void AddSession(Clientuser client) async {
    String IdGoogle = await GetId(client.email);
    Sessions sessions = new Sessions();
    await sessions.addSessionValue("emailGoogle", client.email);
    await sessions.addSessionValue("cellphoneGoogle", client.cellphone);
    await sessions.addSessionValue("idGoogle", IdGoogle);
  }

  //Verifica que exista en la base de datos
  //return cellphone si existe
  //return Error si no
  Future<String> GetCellphoneIfExists(String email) async {
    try {
      var url = Service.url + "UserAdd/UserController.php";
      /* var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
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

  Future<void> LogOutGoogle() async {
    await googleSignIn.signOut();
  }
}
