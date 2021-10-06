import 'package:twilio_flutter/twilio_flutter.dart';

class Sms {
  late TwilioFlutter twilioFlutter;
  instantiateTwilio() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC326ebcdec7c5f6a04851d7857e57d947',
        authToken: '2b705c0364c9e6b0a5692fa61a4e2f15',
        twilioNumber: '+12183797509');
  }

  sendSms(String number, String msg) {
    instantiateTwilio();
    twilioFlutter.sendSMS(toNumber: number, messageBody: msg);
  }
}
