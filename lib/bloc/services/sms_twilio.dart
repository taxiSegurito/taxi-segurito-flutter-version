import 'package:twilio_flutter/twilio_flutter.dart';

class Sms {
  late TwilioFlutter twilioFlutter;
  instantiateTwilio() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC326ebcdec7c5f6a04851d7857e57d947',
        authToken: 'd4f5da60cf1412e78264cf5aa549aad1',
        twilioNumber: '+12183797509');
  }

  sendSms(String number, String msg) {
    instantiateTwilio();
    twilioFlutter.sendSMS(toNumber: number, messageBody: msg);
  }
}
