import 'package:twilio_flutter/twilio_flutter.dart';

class Sms {
  late TwilioFlutter twilioFlutter;
  instantiateTwilio() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC326ebcdec7c5f6a04851d7857e57d947',
        authToken: 'd353f1e3ae557f1aa5281d88ff738c79',
        twilioNumber: '+12183797509');
  }

  sendSms(String number, String msg) {
    instantiateTwilio();
    twilioFlutter.sendSMS(toNumber: number, messageBody: msg);
  }
}
