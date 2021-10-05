import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';

List<Driver> listDriver = [
  Driver("Juan", "1232348", "12234234678"),
  Driver("Rodrigo", "1232342378", "14345678"),
  Driver("Marcos", "142342378", "12342343678"),
  Driver("Raul", "2235678", "123452348"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
];

class RegisterVehicleFunctionality {
  BuildContext context;

  String? model;
  String? plate;
  String? colorCar;
  String? capacity;
  Driver? driver;
  List<Image>? listImage;
  VoidCallback? activeShowDialog;
  Vehicle? vehicle;

  RegisterVehicleFunctionality(
      {required this.context,
      this.model,
      this.plate,
      this.driver,
      this.colorCar,
      this.capacity,
      this.activeShowDialog,
      this.listImage});

  closeNavigator() {
    Navigator.of(context).pop();
  }

  List<Image> getListImage() {
    return listImage!.toList();
  }

  onPressedbtnRegisterCar() {
    //TODO: implementar el onPressed del boton registrar
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }

  onPressedSearhDriver(String value) {
    //TODO: implementar el buscador con la base de datos y el resultado añadirlo a la lista que esta acontinuacion.

    listDriver = [
      Driver("Juan", "1232348", "12234234678"),
    ];
  }
}
