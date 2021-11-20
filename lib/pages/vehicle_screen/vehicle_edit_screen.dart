import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';

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

  @override
  ImagesFileAdapter getImageFileAdapter() {
    return ImagesFileAdapter(
      imagePathDefaultUser: "assets/images/carDefault.png",
      imageMainBase64: stringFromBase64Bytes(vehicle.picture),
      assignValue: (value) {
        vehicle.picture = bytesFromBase64String(value);
      },
    );
  }
}
