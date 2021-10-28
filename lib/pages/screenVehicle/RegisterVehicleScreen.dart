import 'package:taxi_segurito_app/models/Vehicle.dart';

import 'ScreensVehicleFunctionality.dart';
import 'BaseScreenVehicle.dart';

class RegisterVehicleScreen extends ScreenVehicleBase {
  ScreenVehicleFunctionality registerVehicleFunctionality =
      new ScreenVehicleFunctionality();
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
  ScreenVehicleFunctionality functionality() {
    return registerVehicleFunctionality;
  }

  @override
  String textButton() {
    return "Registrar";
  }

  @override
  bool isRegister() {
    return true;
  }
}
