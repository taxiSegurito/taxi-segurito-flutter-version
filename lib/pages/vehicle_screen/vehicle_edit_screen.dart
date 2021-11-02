import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';

import 'vehicle_screen_functionality.dart';
import 'base_vehicle_screen.dart';

// ignore: must_be_immutable
class VehicleEditScreen extends BaseVehicleScreen {
  Vehicle vehicle;
  Driver driver = new Driver("juan Rodrigues", "12345678", "12345678");
  VehicleEditScreen(this.vehicle);
  VehicleScreenFunctionality registerVehicleFunctionality =
      new VehicleScreenFunctionality();

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
  VehicleScreenFunctionality functionality() {
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
