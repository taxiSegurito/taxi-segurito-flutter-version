import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  //GOOGLE Methods
  //SignInWithGoogle

  Future<User?> signInWithGoogle() async {
    log(TAG + ", SignInWithGoogle() init...");
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    log(TAG +
        ", SignInWithGoogle() googleuser email -> ${googleSignInAccount!.email}");
    log(TAG +
        ", SignInWithGoogle() googleuser email -> ${googleSignInAccount.displayName}");
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        log("Error en autentificar");
      }
    }
    String fullName = user!.displayName.toString();
    String email = user!.email.toString();
    String cellphone = user!.phoneNumber.toString();
    String urlImage = user!.photoURL.toString();
    if (cellphone == "null") {
      cellphone = "No Tiene";
    }
    AddDataGoogle(fullName, email, cellphone);

    return IsCurrentSignIn(user!);
  }

  //IsCurrentSignIn
  Future<User?> IsCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = auth.currentUser;
      assert(user.uid == currentUser!.uid);
      log(TAG + ", SigInWithGoogle succeeded: $user");
      return user;
    }
    //si algo salio mal devolveremos null
    return null;
  }

  void AddDataGoogle(String fullName, String email, String cellphone) async {
    var url =
        await "https://taxi-segurito.000webhostapp.com/flutter_api/UserAdd/UserController.php";

    log(fullName + "-  http");
    var response = await http.put(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "password": "Google", //por defecto
          "fullName": fullName,
          "cellphone": cellphone,
          "typeRegister": "Google",
          "idrole": 1,
        }));
    log(response.body);
  }
}
