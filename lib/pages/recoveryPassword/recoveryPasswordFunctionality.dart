import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/bloc/services/email/emailSender.dart';
import 'package:taxi_segurito_app/services/user_service.dart';
import 'package:taxi_segurito_app/pages/user/updatePassword.dart';
import 'dart:math';

class RecoveryPasswordFuncionality {
  late BuildContext context;
  RecoveryPasswordFuncionality(this.context);

  TextEditingController emailController = TextEditingController();
  TextEditingController codeInputController = TextEditingController();
  String lastEmailAux = '';
  String codeVerify = '';
  bool areButtonsEnabled = true;

  /// Send a email with a verify code to the email on the email_Controller.
  onPressedBtnEnviarEmail() {
    FocusScope.of(context).unfocus();
    if (emailController.text == "") {
      GlobalToast.displayToast(Text("Debe ingresar su correo."), Colors.yellow,
          Icon(Icons.warning), 3);
    } else {
      areButtonsEnabled = false;
      codeVerify = generateVerifyCode();
      lastEmailAux = emailController.text;
      if (EmailSender.validateEmail(lastEmailAux)) {
        comprobateIsRegistered(lastEmailAux);
      } else {
        GlobalToast.displayToast(Text("El correo no existe."), Colors.yellow,
            Icon(Icons.warning), 3);
        areButtonsEnabled = true;
      }
    }
  }

  ///Redirects to updatePassword_page.dart when the verify code is the correct.
  onPressedBtnConfirmar() {
    if (validateCodeVerify()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdatePassword(lastEmailAux)),
      );
    }
  }

  ///Returns a string of six random numbers.
  String generateVerifyCode() {
    String verificationCode = '';
    Random rng = new Random();
    for (int i = 0; i < 6; i++) {
      verificationCode += rng.nextInt(10).toString();
    }
    return verificationCode;
  }

  ///Comprobates if a email is registered on database and send the verify code to the email.
  comprobateIsRegistered(_email) async {
    UserService userService = new UserService();
    final userId = await userService.getIdByEmail(_email);
    final isRegistered = userId != 'error';

    if (!isRegistered) {
      GlobalToast.displayToast(
          Text("Correo no registrado."), Colors.red, Icon(Icons.error), 3);
    } else {
      GlobalToast.displayToast(
          Text("Enviando..."), Colors.green, Icon(Icons.timer), 3);

      EmailSender emailSender = EmailSender.withGmailApp();
      final result = await emailSender.sendEmail(lastEmailAux,
          'Ingresa el siguiente código para restablecer tu contraseña:\n$codeVerify');

      if (result == 'success')
        GlobalToast.displayToast(
            Text("¡Correo enviado!"), Colors.green, Icon(Icons.check), 3);
      else {
        GlobalToast.displayToast(Text("No se pudo enviar el email..."),
            Colors.red, Icon(Icons.error), 3);
      }
    }

    areButtonsEnabled = true;
  }

  ///Comprobates if the code in codeInput_Controller and the code sended are the same.
  bool validateCodeVerify() {
    bool isValid = false;
    if (codeInputController.text == '') {
      GlobalToast.displayToast(Text("Ingrese el código de verificación."),
          Colors.yellow, Icon(Icons.warning), 3);
    } else {
      if (codeVerify == codeInputController.text) {
        isValid = true;
      } else {
        GlobalToast.displayToast(Text("Código de verificación inválido."),
            Colors.red, Icon(Icons.warning), 3);
      }
    }
    return isValid;
  }
}
