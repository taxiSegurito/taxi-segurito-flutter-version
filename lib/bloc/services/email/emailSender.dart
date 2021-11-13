import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:email_validator/email_validator.dart';
import 'package:taxi_segurito_app/bloc/services/email/emailAccount.dart';

class EmailSender {
  late EmailAccount emailFrom;

  EmailSender.withGmailApp() {
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
    try {
      await send(message, smtpServer);
      return "success";
    } on MailerException {
      return "failed";
    }
  }

  ///Comprobate if a email is real.
  static bool validateEmail(email) {
    final _isValid = EmailValidator.validate(email);
    return _isValid;
  }
}
