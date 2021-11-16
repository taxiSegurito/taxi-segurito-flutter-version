import 'package:twilio_flutter/twilio_flutter.dart';

class Sms {
  late TwilioFlutter twilioFlutter;
  instantiateTwilio() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACe55a54d8d8f54d79f29d349cd8002431',
        authToken: 'df0e4d6191e31a5f686718f5ed588429',
        twilioNumber: '++19899663688');
  }

  sendSms(String number, String msg) {
    instantiateTwilio();
    twilioFlutter.sendSMS(toNumber: number, messageBody: msg);
  }
}
