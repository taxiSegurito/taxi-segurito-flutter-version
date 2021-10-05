import 'package:form_field_validator/form_field_validator.dart';

class StringValidator extends TextFieldValidator {
  StringValidator({required String errorText}) : super(errorText);
  @override
  bool isValid(value) => true;
}

class NumberValidator extends TextFieldValidator {
  NumberValidator({required String errorText}) : super(errorText);
  @override
  bool isValid(value) => true;
}

class PasswordValidator extends TextFieldValidator {
  PasswordValidator({required String errorText}) : super(errorText);
  @override
  bool isValid(value) => true;
}
