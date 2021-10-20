import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/widgets/SelectDriverCard.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/widgets/SearchDialogDriver.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/pages/registerVehicle/RegisterVehicleFunctionality.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';

import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

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

    SelectDriverCard? cardInformationDriver;
    ImagesFileAdapter imageCar = new ImagesFileAdapter(
      imagePath: "assets/images/carDefault.png",
    );
    ImagesFileAdapter imageCarTop = new ImagesFileAdapter(
      imagePath: "assets/images/carDefault.png",
    );

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = new Text(
      "Registro de Vehiculo",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    callBackSendData(Driver driver) {
      cardInformationDriver!.updateParamaters(driver);
      Fluttertoast.showToast(
          msg: driver.name,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }

    SearchDialogDriver showDialogSearch = new SearchDialogDriver(
        context: context,
        ontapButtonCancel: () {
          closeNavigator(context);
        },
        callback: callBackSendData,
        titleShowDialog: "Buscar conductor",
        buttonCancelText: "Cancelar",
        callbackValueSearch: (String value) {
          registerVehicleFunctionality.onPressedSearhDriver(value);
        });

    CustomTextField txtCarColor = new CustomTextField(
      hint: 'Color del vehiculo',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          StringValidator(
              errorText:
                  "Ingrese el nombre del color Correctamente sin numeros"),
        ],
      ),
    );

    CustomTextField txtCapacity = new CustomTextField(
      hint: 'Capacidad',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "Ingrese la capacidad en formato texto"),
      ]),
    );
    CustomTextField txtModelCar = new CustomTextField(
      hint: 'Modelo',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        RequiredValidator(errorText: "Campo vacio")
      ]),
    );

    CustomTextField txtNumberPlate = new CustomTextField(
      hint: 'Placa',
      multiValidator:
          MultiValidator([RequiredValidator(errorText: "Campo Vacio")]),
    );
    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        registerVehicleFunctionality.onPressedbtnCancelRegisterCar();
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

    cardInformationDriver = new SelectDriverCard(
      headerText: 'Seleccione un Vehiculo',
      driver: Driver(),
      ontap: () {
        showDialogSearch.showAlertDialog();
      },
      ontapCloseDialog: () {
        showDialogSearch.closeDialog();
      },
    );

    bool isRegisterDataVehicle() {
      bool isValidCardData = cardInformationDriver!.getIsValid();
      bool isValidImageCar = imageCar.getIsValid();
      bool isValidImageCarTop = imageCarTop.getIsValid();

      if (_formKey.currentState!.validate() &&
          isValidCardData &&
          isValidImageCar &&
          isValidImageCarTop) {
        Image imageOne = imageCar.getImage();
        Image imageTwo = imageCarTop.getImage();
        var listImage = {imageOne, imageTwo};
        registerVehicleFunctionality = new RegisterVehicleFunctionality(
            model: txtModelCar.getValue(),
            plate: txtNumberPlate.getValue(),
            colorCar: txtCarColor.getValue(),
            capacity: txtCapacity.getValue(),
            driver: cardInformationDriver.getDriver(),
            listImage: listImage.toList(),
            context: context,
            activeShowDialog: activeShowDialog);
        return true;
      }
      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (isRegisterDataVehicle()) {
          registerVehicleFunctionality.onPressedbtnRegisterCar();
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
                    Container(
                      margin: new EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 50.0, right: 50.0),
                      child: Row(
                        children: [
                          Expanded(child: imageCar),
                          Expanded(child: imageCarTop)
                        ],
                      ),
                    ),
                    txtModelCar,
                    txtNumberPlate,
                    txtCarColor,
                    txtCapacity,
                    containerButtons,
                  ],
                ))));
  }
}
