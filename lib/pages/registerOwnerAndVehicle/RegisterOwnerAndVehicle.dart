import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/providers/ImagesFile.dart';
import 'package:taxi_segurito_app/components/inputs/CustomDropdownButton.dart';

import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicleFunctionality.dart';

class RegisterOwnerAndVehicle extends StatefulWidget {
  RegisterOwnerAndVehicle({Key? key}) : super(key: key);

  @override
  _RegisterOwnerAndVehicleState createState() =>
      _RegisterOwnerAndVehicleState();
}

class _RegisterOwnerAndVehicleState extends State<RegisterOwnerAndVehicle> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterOwnerAndVehicleFunctionality registerOwnerAndVehicleFunctionality;
    //CustomDropDowMenu ddmEmpresa = new CustomDropDowMenu();
    ImagesFile imageCar = new ImagesFile();
    var listItem = ["item1", "item2"];
    /*CustomDropdownButton customDropdownButton = new CustomDropdownButton(
      listItem: listItem,
      hint: "Nombre Empresa",
    );*/

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = new Text(
      "Registrar Vehiculo",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    CustomTextField txtNameOwner = new CustomTextField(
      hint: "Nombres",
    );

    CustomTextField txtDni =
        new CustomTextField(hint: "Documento de identidad");

    CustomTextField txtNacinonalityOwner = new CustomTextField(
      hint: "Nacionalidad del dueño",
    );

    CustomTextField txtPhone = new CustomTextField(
      hint: "Telefono",
    );

    CustomTextField txtModelCar = new CustomTextField(hint: "Modelo");

    CustomTextField txtNumberPlate = new CustomTextField(hint: "N° de Placa");

    CustomTextField txtCarColor = new CustomTextField(
      hint: "Color",
    );

    CustomTextField txtCapacity = new CustomTextField(hint: "Capacidad");

    CustomDialogShow customDialogShow = new CustomDialogShow(
        buttonText: "Aceptar",
        ontap: () {
          closeNavigator(context);
        },
        context: context,
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!");

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
      onTap: () {
        //bool j = customDropdownButton.getIsValid();
        /*Fluttertoast.showToast(
           // msg: j.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);*/
        if (_formKey.currentState!.validate()) {
          registerOwnerAndVehicleFunctionality =
              new RegisterOwnerAndVehicleFunctionality(
                  context,
                  txtNameOwner.getValue(),
                  txtDni.getValue(),
                  txtNacinonalityOwner.getValue(),
                  txtPhone.getValue(),
                  txtModelCar.getValue(),
                  txtNumberPlate.getValue(),
                  txtCarColor.getValue(),
                  txtCapacity.getValue());
          registerOwnerAndVehicleFunctionality.onPressedbtnRegisterCar();
        }
        // customDialogShow.getShowDialog();
      },
      buttonText: "Registrar",
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 5,
      marginRight: 0,
      marginTop: 0,
    );

    AppBar appBar = new AppBar(
      backgroundColor: colorMain,
      elevation: 0,
      title: Text(
        'Registro de dueño',
        textAlign: TextAlign.center,
      ),
    );

    Container containerTitle = new Container(
        alignment: Alignment.centerLeft,
        margin: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 35.0, right: 35.0),
        child: title);

    Container containerButtons = new Container(
        alignment: Alignment.centerLeft,
        margin: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: btnCancel),
            Expanded(flex: 1, child: btnRegister)
          ],
        ));

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: appBar,
        drawer: SideMenu(),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    containerTitle,
                    imageCar,
                    //customDropdownButton,
                    txtNameOwner,
                    txtDni,
                    txtNacinonalityOwner,
                    txtPhone,
                    txtModelCar,
                    txtNumberPlate,
                    txtCarColor,
                    txtCapacity,
                    containerButtons,
                  ],
                ))));
  }
}
