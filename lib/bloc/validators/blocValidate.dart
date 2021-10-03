import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:taxi_segurito_app/bloc/validators/validator.dart';

class Validator with Validators {
  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  Stream<String> get username =>
      emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(username, password, (a, b) => true);

  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;

  disponse() {
    emailController.close();
    passwordController.close();
  }
}

final validator = Validator();
