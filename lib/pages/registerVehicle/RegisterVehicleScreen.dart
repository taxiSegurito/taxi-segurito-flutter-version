import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/ScreenVehicleBase.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';

// ignore: must_be_immutable
class RegisterVehicleScreen extends ScreamVehicleBase {
  RegisterVehicleFunctionality registerVehicleFunctionality =
      new RegisterVehicleFunctionality();
  @override
  String titleCardDriverScreen() {
    return 'Seleccione un Conductor';
  }

  @override
  String titleScreen() {
    return 'Registro de vehiculo';
  }

  @override
  String tittleDialog() {
    return 'Registro Exitoso';
  }

  @override
  eventAction() {
    registerVehicleFunctionality.onPressedbtnRegisterCar();
  }

  @override
  RegisterVehicleFunctionality functionality() {
    return registerVehicleFunctionality;
  }
}
