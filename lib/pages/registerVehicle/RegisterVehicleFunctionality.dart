import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';

List<Driver> listDriver = [
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
  Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
];

class RegisterVehicleFunctionality {
  BuildContext? context;

  String? model;
  String? plate;
  String? colorCar;
  String? capacity;
  Driver? driver;
  List<Image>? listImage;
  VoidCallback? activeShowDialog;
  Vehicle? vehicle;

  RegisterVehicleFunctionality(
      {this.context,
      this.vehicle,
      this.model,
      this.plate,
      this.driver,
      this.colorCar,
      this.capacity,
      this.activeShowDialog,
      this.listImage});

  set setContext(context) {
    this.context = context;
  }

  closeNavigator() {
    Navigator.of(context!).pop();
  }

  List<Image> getListImage() {
    return listImage!.toList();
  }

  onPressedbtnRegisterCar() {
    //TODO: implementar el onPressed del boton registrar
  }
  onPressedbtnUpdateVehicle() {}

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }

  onPressedSearhDriver(String value) {
    //TODO: implementar el buscador con la base de datos y el resultado añadirlo a la lista que esta acontinuacion.

    listDriver = [
      Driver(name: "Juan", dni: "1232348", phone: "12234234678"),
    ];
  }
}
