import 'dart:async';

class Validators {
  final validateUsername =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length > 6) {
      sink.add(email);
    } else {
      sink.addError('Username Invalido');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError('Contraseña Invalida');
    }
  });
}
