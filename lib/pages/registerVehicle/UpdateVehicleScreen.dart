import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/ScreenVehicleBase.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';

// ignore: must_be_immutable
class UpdateVehicleScreen extends ScreamVehicleBase {
  Vehicle vehicle;
  Driver driver =
      new Driver(name: "juan Rodrigues", phone: "12345678", dni: "12345678");
  UpdateVehicleScreen(this.vehicle);
  RegisterVehicleFunctionality registerVehicleFunctionality =
      new RegisterVehicleFunctionality();

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

  @override
  String textButton() {
    return "Actualizar";
  }

  @override
  bool isRegister() {
    return false;
  }
}
