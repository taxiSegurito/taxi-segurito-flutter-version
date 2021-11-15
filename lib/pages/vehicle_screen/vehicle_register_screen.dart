import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';

import 'vehicle_screen_functionality.dart';
import 'base_vehicle_screen.dart';

class VehicleRegisterScreen extends BaseVehicleScreen {
  VehicleScreenFunctionality registerVehicleFunctionality =
      new VehicleScreenFunctionality();
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
  VehicleScreenFunctionality functionality() {
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

  @override
  ImagesFileAdapter getImageFileAdapter() {
    return ImagesFileAdapter(
      imagePathDefaultUser: "assets/images/carDefault.png",
      assignValue: (value) {
        vehicle.picture = bytesFromBase64String(value);
      },
    );
  }
}
