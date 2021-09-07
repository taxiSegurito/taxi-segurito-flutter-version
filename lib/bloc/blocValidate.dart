import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:taxi_segurito_app/bloc/validator.dart';

class Bloc with Validators {
  final usernameController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  Stream<String> get username =>
      usernameController.stream.transform(validateUsername);
  Stream<String> get password =>
      passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(username, password, (a, b) => true);

  Function(String) get changeEmail => usernameController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;

  disponse() {
    usernameController.close();
    passwordController.close();
  }
}

final bloc = Bloc();
