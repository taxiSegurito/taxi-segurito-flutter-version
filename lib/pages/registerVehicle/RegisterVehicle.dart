import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/cards/CustomCardSimple.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialogMenu.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialogSearh.dart';
import 'package:taxi_segurito_app/components/dialogs/pruebaDialogo.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';
import 'package:taxi_segurito_app/providers/ImagesFile.dart';
import 'package:taxi_segurito_app/components/inputs/CustomDropdownButton.dart';

import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicleFunctionality.dart';

class RegisterVehicle extends StatefulWidget {
  RegisterVehicle({Key? key}) : super(key: key);

  @override
  _RegisterVehicleState createState() => _RegisterVehicleState();
}

class _RegisterVehicleState extends State<RegisterVehicle> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterVehicleFunctionality registerVehicleFunctionality =
        new RegisterVehicleFunctionality(context: context);
    String titleString = "Registro de Vehiculo";
    CustomCardSimple? cardInformationDriver;
    ImagesFile imageCar = new ImagesFile(
      isImageCarDefault: true,
    );

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = new Text(
      titleString,
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    void doSomething(Driver driver) {
      Fluttertoast.showToast(
          msg: driver.name,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }

    callbackprueba(Driver i) {
      cardInformationDriver!.updateParamaters(i);
      Fluttertoast.showToast(
          msg: i.name,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }

    CustomShowDialogSearch showDialogSearch = new CustomShowDialogSearch(
        context: context,
        ontapButtonCancel: () {
          closeNavigator(context);
        },
        callback: callbackprueba,
        titleShowDialog: "Buscar conductor",
        buttonCancelText: "Cancelar");

    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      ontap: () {
        showDialogSearch.showAlertDialog();
      },
      hint: "Buscar",
    );

    CustomTextField txtCarColor = new CustomTextField(
      hint: "Color",
      isValidName: true,
    );
    CustomTextField txtCapacity = new CustomTextField(hint: "Capacidad");
    CustomTextField txtModelCar = new CustomTextField(hint: "Modelo");

    CustomTextField txtNumberPlate = new CustomTextField(hint: "N° de Placa");

    onPressedbtnTwo() {}
    onPressedbtnOne() {
      Navigator.of(context).pop();
    }

    onPressedbtnThree() {}

    CustomShowDialogMenu showMenu = new CustomShowDialogMenu(
        context: context,
        titleShowDialog: "¿Que deseas registrar?",
        ontapButtonOne: () {
          onPressedbtnOne();
        },
        buttonOneText: "Registrar Vehiculo",
        ontapButtonTwo: onPressedbtnTwo,
        buttonTwoText: "Registrar Empresa",
        buttonTwoColor: Colors.white,
        buttonTextTwoColor: Colors.black,
        ontapButtonThree: onPressedbtnThree,
        buttonThreeText: "Registrar Dueño");

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        showMenu.showAlertDialog();
      },
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: Color.fromRGBO(255, 193, 7, 1),
      buttonBorderColor: Color.fromRGBO(255, 193, 7, 1),
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );
    CustomDialogShow dialogShowRegister = new CustomDialogShow(
        ontap: () {
          registerVehicleFunctionality.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!",
        context: context);

    activeShowDialog() {
      dialogShowRegister.getShowDialog();
    }

    bool registerDataVehicle() {
      if (_formKey.currentState!.validate()) {
        registerVehicleFunctionality = new RegisterVehicleFunctionality(
            model: txtModelCar.getValue(),
            plate: txtNumberPlate.getValue(),
            colorCar: txtCarColor.getValue(),
            capacity: txtCapacity.getValue(),
            idConductor: txtSearch.getValue(),
            context: context,
            activeShowDialog: activeShowDialog);
        return true;
      }
      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          if (registerDataVehicle()) {
            registerVehicleFunctionality.onPressedbtnRegisterCar();
          }
        }
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
    );

    Container containerTitle = new Container(
        alignment: Alignment.center,
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

    cardInformationDriver = new CustomCardSimple(
      ontap: () {
        showDialogSearch.showAlertDialog();
      },
      ontapCloseDialog: () {
        showDialogSearch.closeDialog();
      },
    );

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
                    Container(
                        margin: new EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
                        child: cardInformationDriver),
                    imageCar,
                    txtModelCar,
                    txtNumberPlate,
                    txtCarColor,
                    txtCapacity,
                    containerButtons,
                  ],
                ))));
  }
}
