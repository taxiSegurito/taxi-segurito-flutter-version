import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';
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
  Vehicle? vehicle = new Vehicle.insert();
  late VehicleService vehicleService;
  late OwnerService ownerService;

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

  onPressedbtnRegisterCar() async {
    vehicleService.insertVehicle(vehicle!).then((value) {
      if (value) {
        activeShowDialog!();
      }
    });
  }

  Future<List<Owner>?> getOwners() async {
    List<Owner> ownerList = [];
    ownerList.clear();
    try {
      ownerList = await ownerService.select();
      return ownerList;
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  onPressedbtnUpdateVehicle() {
    vehicleService = new VehicleService();
    Vehicle vehicleModel = vehicle!;
    print("object");
    vehicleService.update(vehicleModel).then((value) {
      if (value) {
        Navigator.of(context!).popUntil((route) => route.isFirst);
      } else {
        print(value);
      }
    });
    // update(vehicleModel).then(
    //   (value) {
    //     if (value) {
    //       activeShowDialog!();m
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
