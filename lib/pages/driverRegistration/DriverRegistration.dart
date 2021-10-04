import 'package:flutter/material.dart';

import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistrationFuncionality.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';
import 'package:taxi_segurito_app/providers/ImagesFile.dart';

class DriverRegistration extends StatefulWidget {
  DriverRegistration({Key? key}) : super(key: key);

  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    DriverRegistrationFuncionality? driverRegistrationFuncionality =
        new DriverRegistrationFuncionality(context: context);

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = Text(
      "Registrar Conductor",
      style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontFamily: "Raleway",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.justify,
    );

    ImagesFile imageUser = new ImagesFile(
      isShapeCircle: true,
      isImageUserDefault: true,
    );

    CustomTextField txtNameDriver = new CustomTextField(
      hint: "Nombres",
    );

    CustomTextField txtLastName = new CustomTextField(
      hint: "Primer apellido",
    );

    CustomTextField txtSecondLastName = new CustomTextField(
      hint: "Segundo apellido",
    );

    CustomTextField txtDriverCI = new CustomTextField(
      hint: "Número de carnet",
    );

    CustomTextField txtDriverLicense = new CustomTextField(
      hint: "Número de licencia de conducir",
    );

    CustomTextField txtPhoneNumber = new CustomTextField(
      hint: "Número de celular",
    );

    CustomDialogShow customDialogShow = new CustomDialogShow(
        buttonText: "Aceptar",
        ontap: () {
          closeNavigator(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DriversList()));
          ;
        },
        context: context,
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!");

    bool registerDataDriver() {
      if (_formKey.currentState!.validate()) {
        driverRegistrationFuncionality = new DriverRegistrationFuncionality(
            context: context,
            names: txtNameDriver.getValue(),
            lastName: txtLastName.getValue(),
            secondLastName: txtSecondLastName.getValue(),
            driverCI: txtDriverCI.getValue(),
            driverLicense: txtDriverLicense.getValue(),
            phone: txtPhoneNumber.getValue());

        return true;
      }

      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (registerDataDriver()) {
          driverRegistrationFuncionality!.onPressedbtnRegisterDriver();
          customDialogShow.getShowDialog();
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

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        driverRegistrationFuncionality!.onPressedbtnCancelRegisterDriver();
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: new EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 50.0, right: 35.0),
                  child: title),
              imageUser,
              txtNameDriver,
              txtLastName,
              txtSecondLastName,
              txtDriverCI,
              txtDriverLicense,
              txtPhoneNumber,
              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 38.0, bottom: 10.0, left: 50.0, right: 50.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: btnCancel),
                    Divider(),
                    Expanded(flex: 1, child: btnRegister)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
