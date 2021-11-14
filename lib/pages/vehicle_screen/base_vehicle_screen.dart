import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

import './widgets/SelectDriverCard.dart';

import 'vehicle_screen_functionality.dart';
import 'widgets/SearchDialogDriver.dart';

abstract class BaseVehicleScreen extends StatefulWidget {
  _BaseVehicleScreenState _screamVehicleBaseState =
      new _BaseVehicleScreenState();

  late Vehicle vehicle;
  late Driver driver;

  @override
  State<BaseVehicleScreen> createState() {
    return _screamVehicleBaseState;
  }

  bool isRegister();
  String titleScreen();
  String titleCardDriverScreen();
  String tittleDialog();
  String textButton();
  VehicleScreenFunctionality functionality();
  eventAction();
}

class _BaseVehicleScreenState extends State<BaseVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    VehicleScreenFunctionality functionality = widget.functionality();
    functionality.setContext = context;

    SelectDriverCard? cardInformationDriver;

    ImagesFileAdapter imageCar = new ImagesFileAdapter(
      imagePathDefaultUser: "assets/images/carDefault.png",
      imageMainBase64: stringFromBase64Bytes(widget.vehicle.picture),
      assignValue: (value) {
        widget.vehicle.picture = bytesFromBase64String(value);
      },
    );

    CustomTextField txtCarColor = new CustomTextField(
      value: widget.vehicle.color,
      hint: 'Color del vehiculo',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          StringValidator(
              errorText:
                  "Ingrese el nombre del color Correctamente sin numeros"),
        ],
      ),
      assignValue: (value) {
        widget.vehicle.color = value;
      },
    );

    CustomTextField txtCapacity = new CustomTextField(
      value: widget.vehicle.capacity.toString(),
      hint: 'Capacidad',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          StringValidator(errorText: "Ingrese la capacidad en formato texto"),
        ],
      ),
      assignValue: (value) {
        widget.vehicle.capacity = int.parse(value);
      },
    );

    CustomTextField txtModelCar = new CustomTextField(
      value: widget.vehicle.model,
      hint: 'Modelo',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          RequiredValidator(errorText: "Campo vacio")
        ],
      ),
      assignValue: (value) {
        widget.vehicle.model = value;
      },
    );

    CustomTextField txtNumberPlate = new CustomTextField(
      value: widget.vehicle.pleik,
      hint: 'Placa',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo Vacio"),
        ],
      ),
      assignValue: (value) {
        widget.vehicle.pleik = value;
      },
    );

    Text title = new Text(
      widget.titleScreen(),
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    callBackSendData(Driver driver) {
      cardInformationDriver!.updateParamaters(driver);
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
        functionality.onPressedSearchDriver(value);
      },
    );

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        functionality.onPressedbtnCancelRegisterCar();
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
          functionality.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: widget.tittleDialog(),
        context: context);

    activeShowDialog() {
      dialogShowRegister.show();
    }

    cardInformationDriver = new SelectDriverCard(
      headerText: widget.titleCardDriverScreen(),
      ontap: () {
        showDialogSearch.showAlertDialog();
      },
      driver: widget.driver,
      ontapCloseDialog: () {
        showDialogSearch.closeDialog();
      },
    );

    bool isRegisterDataVehicle() {
      bool isValidCardData =
          widget.isRegister() ? cardInformationDriver!.getIsValid() : true;
      bool isValidImageCar = imageCar.validate();

      if (_formKey.currentState!.validate() &&
          isValidCardData &&
          isValidImageCar) {
        functionality.vehicle = widget.vehicle;
        functionality.driver = cardInformationDriver!.getDriver();
        functionality.activeShowDialog = activeShowDialog;

        return true;
      }
      return false;
    }

    CustomButton btnGeneric = new CustomButton(
      onTap: () {
        if (isRegisterDataVehicle()) {
          widget.eventAction();
        }
      },
      buttonText: widget.textButton(),
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
            Expanded(flex: 1, child: btnGeneric)
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
                  top: 20.0,
                  bottom: 10.0,
                  left: 50.0,
                  right: 50.0,
                ),
                child: widget.isRegister() ? cardInformationDriver : SizedBox(),
              ),
              Container(
                margin: new EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 50.0, right: 50.0),
                child: Row(
                  children: [
                    Expanded(child: imageCar),
                  ],
                ),
              ),
              txtModelCar,
              txtNumberPlate,
              txtCarColor,
              txtCapacity,
              containerButtons,
            ],
          ),
        ),
      ),
    );
  }
}
