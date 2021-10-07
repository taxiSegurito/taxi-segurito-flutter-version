import 'package:taxi_segurito_app/models/person.dart';

class Driver extends Person {
  String dni;
  Driver(String fullName, this.dni, String cellphone)
      : super.insert(fullName, cellphone);
}
