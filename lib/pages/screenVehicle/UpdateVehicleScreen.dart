import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';

import 'ScreensVehicleFunctionality.dart';
import 'BaseScreenVehicle.dart';

// ignore: must_be_immutable
class UpdateVehicleScreen extends ScreamVehicleBase {
  Vehicle vehicle;
  Driver driver =
      new Driver(name: "juan Rodrigues", phone: "12345678", dni: "12345678");
  UpdateVehicleScreen(this.vehicle);
  ScreenVehicleFunctionality registerVehicleFunctionality =
      new ScreenVehicleFunctionality();

  @override
  String titleCardDriverScreen() {
    return 'Actualice un Conductor';
  }

  @override
  String titleScreen() {
    return 'Actualizacion de vehiculo';
  }

  @override
  String tittleDialog() {
    return 'Actualizacion Exitoso';
  }

  @override
  eventAction() {
    registerVehicleFunctionality.onPressedbtnUpdateVehicle();
  }

  @override
  ScreenVehicleFunctionality functionality() {
    return registerVehicleFunctionality;
  }

  @override
  String textButton() {
    return "Actualizar";
  }

  @override
  bool isRegister() {
    return false;
  }
}
