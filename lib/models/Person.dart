import 'dart:html';

import 'package:taxi_segurito_app/models/AuditData.dart';

class Person extends AuditData {
  late int idPerson;
  late String fullName;
  late String cellphone;

  Person(this.idPerson, this.fullName, this.cellphone, registerDate, updateDate,
      status)
      : super(registerDate, updateDate, status);

  Person.insert(this.fullName, this.cellphone) : super.Default();
  Person.Default() : super.Default();

  Person.InsertForGoogleAndFacebook(this.fullName, this.cellphone)
      : super.Default();
}
