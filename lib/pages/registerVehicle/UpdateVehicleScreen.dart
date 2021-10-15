import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/ScreenVehicleBase.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';

// ignore: must_be_immutable
class UpdateVehicleScreen extends ScreamVehicleBase {
  Vehicle vehicle;
  UpdateVehicleScreen(this.vehicle);
  RegisterVehicleFunctionality registerVehicleFunctionality =
      new RegisterVehicleFunctionality();

  @override
  Vehicle setDataVehicle() {
    return vehicle;
  }

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
    return 'Actualizado Exitoso';
  }

  @override
  eventAction() {
    registerVehicleFunctionality.onPressedbtnUpdateVehicle();
  }

  @override
  RegisterVehicleFunctionality functionality() {
    return registerVehicleFunctionality;
  }
}
