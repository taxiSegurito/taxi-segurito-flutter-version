import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/Driver.dart';

List<Driver> listDriver = [
  Driver("Juan", "1232348", "12234234678"),
  Driver("Rodrigo", "1232342378", "14345678"),
  Driver("Marcos", "142342378", "12342343678"),
  Driver("Raul", "2235678", "123452348"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
  Driver("Juan", "12345678", "12345678"),
];

class RegisterVehicleFunctionality {
  BuildContext context;

  String? model;
  String? plate;
  String? colorCar;
  String? capacity;
  Driver? driver;
  List<Image>? listImage;
  VoidCallback? activeShowDialog;

  RegisterVehicleFunctionality(
      {required this.context,
      this.model,
      this.plate,
      this.driver,
      this.colorCar,
      this.capacity,
      this.activeShowDialog,
      this.listImage});

  closeNavigator() {
    Navigator.of(context).pop();
  }

  List<Image> getListImage() {
    return listImage!.toList();
  }

  onPressedbtnRegisterCar() {
    agregarUsuario();
    Fluttertoast.showToast(
        msg: driver!.name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    activeShowDialog!();
  }

  onPressedbtnCancelRegisterCar() {
    closeNavigator();
  }

  onPressedSearhDriver(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
    listDriver = [
      Driver("Juan", "1232348", "12234234678"),
    ];
  }

  void agregarUsuario() {
    /*var url = "http://192.168.1.9/pruebas/agregardueño.php";
    http.post(Uri.parse(url), body: {
      "fullName": nameUser,
      "carnet": dni,
      "nacionality": ownerNationality,
      "phoneNumber": phone,
      "model": model,
      "plaqueNumber": numberPlate,
      "color": carColor,
      "capacity": capacity
    });*/
  }
}
