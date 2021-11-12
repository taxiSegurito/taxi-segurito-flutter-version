import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:email_validator/email_validator.dart'; 
import 'package:taxi_segurito_app/bloc/services/email/emailAccount.dart';

class EmailSender
{
  late EmailAccount emailFrom;

  EmailSender.withGmailApp()
  {
    emailFrom = new EmailAccount.gmailApp();
  }
  ///Send a email to a email adress.
  Future sendEmail(emailToSend, msg) async {
    final smtpServer = gmail(emailFrom.adress, emailFrom.password);
    final message = Message()
      ..from = Address(emailFrom.adress, 'Taxi Segurito')
      ..recipients.add(emailToSend)
      ..subject = 'App Taxi Segurito'
      ..text = msg;
    try 
    {
      print("______SendEmail______");
      final sendReport = await send(message, smtpServer);
      print('  1 Sended: ' + sendReport.toString());
      return "success";
    } on MailerException catch (e) {
      print('  2 Error: '+e.message);
      for (var p in e.problems) {
        print('    Problem: ${p.code}: ${p.msg}');
      }
      return "failed";
    }
  }

  ///Comprobate if a email is real.
  static bool validateEmail(email)
  {
    final _isValid = EmailValidator.validate(email);
    return _isValid;
  }
}        



