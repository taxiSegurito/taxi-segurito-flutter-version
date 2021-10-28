import 'dart:typed_data';

import 'package:taxi_segurito_app/models/person.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';

class Driver extends Person {
  late String ci;
  late String license;
  late Uint8List picture;
  Driver(String fullName, this.ci, String cellphone)
      : super.insert(fullName, cellphone);

  Driver.fromJson(Map<String, dynamic> json) {
    super.idPerson = json['id'] as int;
    super.fullName = json['fullname'] as String;
    super.cellphone = json['cellphone'] as String;
    license = json['license'] as String;
    ci = json['ci'] as String;
    super.status = json['status'] as int;

    String pictureBase64 = json['picture'] as String;
    picture = imageFromBase64(pictureBase64);
  }
}
