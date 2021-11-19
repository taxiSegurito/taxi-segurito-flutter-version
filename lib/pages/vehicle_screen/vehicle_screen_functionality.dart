import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/services/vehicle_service.dart';

List<Driver> listDriver = [
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
  Driver("Juan", "1232348", "12234234678"),
];

class VehicleScreenFunctionality {
  BuildContext? context;
  VoidCallback? activeShowDialog;
  Driver? driver;
  Vehicle? vehicle;

  VehicleScreenFunctionality({
    this.context,
    this.vehicle,
    this.driver,
    this.activeShowDialog,
  });

  final Map<String, dynamic> someMap = {
    "context": BuildContext,
    "vehicle": Vehicle,
    "model": String,
  };

  set setContext(context) {
    this.context = context;
  }

  closeNavigator() {
    Navigator.of(context!).pop();
  }

  onPressedbtnRegisterCar() {
    //TODO: implementar el onPressed del boton registrar
  }

  onPressedbtnUpdateVehicle() {
    Vehicle vehicleModel = vehicle!;
    // update(vehicleModel).then(
    //   (value) {
    //     if (value) {
    //       activeShowDialog!();
    //     }
    //   },
    // );
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }

  onPressedSearchDriver(String value) {
    //TODO: implementar el buscador con la base de datos y el resultado añadirlo a la lista que esta acontinuacion.

    listDriver = [
      Driver("Juan", "1232348", "12234234678"),
    ];
  }
}
