import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/services/vehicle_service.dart';

class VehicleScreenFunctionality {
  BuildContext? context;
  VoidCallback? activeShowDialog;
  Vehicle? vehicle;

  VehicleScreenFunctionality({
    this.context,
    this.vehicle,
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
    print(
        '${vehicle!.capacity}  ${vehicle!.color} ${vehicle!.model} ${vehicle!.pleik}');
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
}
