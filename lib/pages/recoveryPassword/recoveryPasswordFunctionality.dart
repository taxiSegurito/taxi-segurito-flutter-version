import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/bloc/services/email/EmailSender.dart';
import 'package:taxi_segurito_app/services/user_service.dart';
import 'package:taxi_segurito_app/pages/user/updatePassword.dart';
import 'dart:math';

class RecoveryPasswordFuncionality {
  
  late BuildContext context;
  RecoveryPasswordFuncionality(this.context);
  
  TextEditingController email_Controller = TextEditingController();
  TextEditingController codeInput_Controller = TextEditingController();
  var lastEmailAux = '';
  var codeVerify = '';
  var isEnabledButtons = true;

// UI FUNCTIONS

  /// UI 1: Envia un email con condigo de verificacion al email ingresado en email_Controller.
  onPressedBtnEnviarEmail()
  {
    FocusScope.of(context).unfocus(); //Se deshace de ese molesto tecldo en pantalla
    if(email_Controller.text == "")
    {
      GlobalToast.displayToast(Text("Debe ingresar su correo."), Colors.yellow, Icon(Icons.warning), 3);
    }
    else
    {
      isEnabledButtons = false;
      codeVerify = generateVerifyCode();
      lastEmailAux = email_Controller.text;
      if(EmailSender.validateEmail(lastEmailAux))
      {
        comprobateIsRegistered(lastEmailAux);
      } 
      else 
      {
        GlobalToast.displayToast(Text("El correo no existe."), Colors.yellow, Icon(Icons.warning), 3);
        isEnabledButtons = true;
      }
    }
  }
  /// UI 2: Redirecciona a updatePassword_page.dart cuando se ingresa el codeVerify correcto
  onPressedBtnConfirmar()
  {
    if(validateCodeVerify())
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword(lastEmailAux)),);
    }
  }
  

// FUNCTIONS

  ///Function 1: Retorna un codigo de numeros aleatorios de tamaño 6.
  String generateVerifyCode()
  {
    String codeAux = '';
    Random rng = new Random();
    for (int i = 0; i < 6; i++) {
      codeAux += rng.nextInt(10).toString();
    }
    return codeAux;
  }
  ///Function 2: Comprueba si un email esta registrado en la bdd y le envia un correo con el codigo de verificacion.
  comprobateIsRegistered(_email) async
  {
    UserService userService= new UserService();
    final isRegistered = await userService.getIdByEmail(_email);
    if(isRegistered == "Error")
    {
      GlobalToast.displayToast(Text("Este correo no está registrado."), Colors.red, Icon(Icons.error), 3);
    }
    else
    {
          GlobalToast.displayToast(Text("Enviando..."), Colors.green, Icon(Icons.timer), 3);

          EmailSender emailSender = EmailSender.withGmailApp();
          print("lastemail"+lastEmailAux);
          var result = await emailSender.sendEmail(lastEmailAux,'$codeVerify\nIngresa este código para restablecer tu contraseña');

          if(result == 'success') GlobalToast.displayToast(Text("¡Correo enviado!"), Colors.green, Icon(Icons.check), 3);
          else {GlobalToast.displayToast(Text("No se pudo enviar el email..."), Colors.red, Icon(Icons.error), 3);}
    }
    isEnabledButtons = true;
  }

///Function 3: Comprueba si el codigo del codeInput_Controller y el codigo enviado en email son el mismo.
bool validateCodeVerify()
{
  bool isValid = false;
  if(codeInput_Controller.text == "")
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword(email_Controller.text)),); //BORRAAAAAARRRR
    GlobalToast.displayToast(Text("Ingrese el código de verificación."), Colors.yellow, Icon(Icons.warning), 3);
  }
  else
  {
    if(codeVerify == codeInput_Controller.text)
    {
      isValid = true;
    }
    else
    {
      GlobalToast.displayToast(Text("Código de verificación inválido."), Colors.red, Icon(Icons.warning), 3);
    }
  }
  return isValid;
}


}