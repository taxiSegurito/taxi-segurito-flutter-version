import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:taxi_segurito_app/models/user.dart';

class UserData {
  String id;
  String name;
  String dni;
  String phone;
  String rol;
  ImageProvider photo;
  UserData(this.id, this.name, this.dni, this.phone, this.rol, this.photo);
}
