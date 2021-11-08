import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:email_validator/email_validator.dart'; 
import 'package:taxi_segurito_app/bloc/services/email/emailApp.dart';

class EmailSender
{
  static const emailApp = GMailApp.email;
  static const passwordApp = GMailApp.password;
  
  /*IMPORTANTE: El email de taxi segurito debe tener activado la opcion "permitir aplicaciones menos seguras",
    si esta funcionalidad no se usa en mucho tiempo, la opcion se deshabilitará sola, se habilita en google "Cuenta->Seguridad->App menos seguras"
  */
  ///Envia un email con un mensaje a un correo electrónico.
  static Future sendEmail(emailToSend, msg) async {
    final smtpServer = gmail(emailApp, passwordApp);
    final message = Message()
      ..from = Address(emailApp, 'Taxi Segurito')
      ..recipients.add(emailToSend)
      ..subject = 'App Taxi Segurito'
      ..text = msg;
    try 
    {
      print("  ____SendEmail____");
      final sendReport = await send(message, smtpServer); //Envia el email
      print('  1 Sended: ' + sendReport.toString());
      return "success";
    } on MailerException catch (e) {
      print('  2 Error: Message not sent.');
      for (var p in e.problems) {
        print('    Problem: ${p.code}: ${p.msg}');
      }
      return "failed";
    }
  }

  ///Comprueba si el correo es real
  static bool validateEmail(email)
  {
    final _isValid = EmailValidator.validate(email);
    return _isValid;
  }
}

// FUNCTIONS

// Function 1: Envia un email desde el correo de la app, al email deseado.                 



