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
        buttonBorderColor: Color.fromRGBO(255, 193, 7, 1));

    CustomButton btnRegister = new CustomButton(
        onTap: () {},
        buttonText: "Registrar",
        buttonColor: Color.fromRGBO(255, 193, 7, 1),
        buttonTextColor: Colors.white);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: txtNameOwner.getValue(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.yellow);
          },
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 40.0, bottom: 10.0, left: 35.0, right: 35.0),
                child: title),
            txtNameOwner,
            txtDni,
            txtNacinonalityOwner,
            txtPhone,
            txtModelCar,
            txtNumberPlate,
            txtCarColor,
            txtCapacity,
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: btnCancel),
                Expanded(child: btnRegister)

                //btnCancel
              ],
            )
          ],
        )));
  }

  void imprimir(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }
}
