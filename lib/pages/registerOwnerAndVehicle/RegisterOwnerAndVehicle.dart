import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/buttons/button.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';

class RegisterOwnerAndVehicle extends StatefulWidget {
  RegisterOwnerAndVehicle({Key? key}) : super(key: key);

  @override
  _RegisterOwnerAndVehicleState createState() =>
      _RegisterOwnerAndVehicleState();
}

class _RegisterOwnerAndVehicleState extends State<RegisterOwnerAndVehicle> {
  @override
  Widget build(BuildContext context) {
    String UserName = "";

    Text title = new Text(
      "Registrar Vehiculo",
      style: const TextStyle(
          fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );
    Image imageAuto = new Image.asset(
      "lib/components/assets/images/auto.png",
      height: 150,
      width: 150,
    );

    CustomTextField txtNameOwner = new CustomTextField(hint: "Nombre Usuario");
    CustomTextField txtDni =
        new CustomTextField(hint: "Documento de identidad");
    CustomTextField txtNacinonalityOwner =
        new CustomTextField(hint: "Nacionalidad del dueño");
    CustomTextField txtPhone = new CustomTextField(hint: "Telefono");
    CustomTextField txtModelCar = new CustomTextField(hint: "Modelo");
    CustomTextField txtNumberPlate = new CustomTextField(hint: "N° de Placa");
    CustomTextField txtCarColor = new CustomTextField(hint: "Color");
    CustomTextField txtCapacity = new CustomTextField(hint: "Capacidad");

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {},
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: Color.fromRGBO(255, 193, 7, 1),
      buttonBorderColor: Color.fromRGBO(255, 193, 7, 1),
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );

    CustomButton btnRegister = new CustomButton(
      onTap: () {},
      buttonText: "Registrar",
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 5,
      marginRight: 0,
      marginTop: 0,
    );

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 35.0, right: 35.0),
                child: title),
            imageAuto,
            txtNameOwner,
            txtDni,
            txtNacinonalityOwner,
            txtPhone,
            txtModelCar,
            txtNumberPlate,
            txtCarColor,
            txtCapacity,
            Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: btnCancel),
                    Divider(),
                    Expanded(flex: 1, child: btnRegister)
                  ],
                )),
          ],
        )));
  }
}
