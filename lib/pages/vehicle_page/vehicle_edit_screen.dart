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
  String titleScreen() {
    return 'Actualizacion de vehículo';
  }

  @override
  String tittleDialog() {
    return 'Actualización exitosa!';
  }

  @override
  eventAction() {
    registerVehicleFunctionality.onPressedbtnUpdateVehicle();
  }

  @override
  VehicleScreenFunctionality getFunctionality() {
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
