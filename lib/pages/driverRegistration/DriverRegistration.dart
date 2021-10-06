import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistrationFuncionality.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

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

    DriverRegistrationFuncionality driverRegistrationFuncionality =
        new DriverRegistrationFuncionality(context: context);

    Text title = Text(
      "Registrar Conductor",
      style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontFamily: "Raleway",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
    );

    ImagesFileAdapter imageDriver = new ImagesFileAdapter(
        imagePath: "assets/images/userDefault.png", isShapeCircle: true);

    CustomTextField txtNameDriver = new CustomTextField(
      hint: "Nombre",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El nombre es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
    );

    CustomTextField txtLastName = new CustomTextField(
      hint: "Primer apellido",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El apellido es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
    );

    CustomTextField txtSecondLastName = new CustomTextField(
      hint: "Segundo apellido",
      multiValidator: MultiValidator([
        StringValidator(errorText: 'No puede ingresar valores numéricos'),
      ]),
    );

    CustomTextField txtDriverCI = new CustomTextField(
      hint: "Número de carnet",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Número de carnet requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
    );

    CustomTextField txtDriverLicense = new CustomTextField(
      hint: "Número de licencia de conducir",
      multiValidator: MultiValidator([
        RequiredValidator(
            errorText: 'Número de licencia de conducir requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
    );

    CustomTextField txtPhoneNumber = new CustomTextField(
      hint: "Número de celular",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Número de celular requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
    );

    CustomDialogShow dialogShowRegister = new CustomDialogShow(
        ontap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DriversList()));
        },
        buttonText: "Aceptar",
        context: context,
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!");

    activeShowDialog() {
      dialogShowRegister.getShowDialog();
    }

    bool registerDataDriver() {
      bool isValidImageDriver = imageDriver.getIsValid();
      if (_formKey.currentState!.validate() && isValidImageDriver) {
        Image image = imageDriver.getImage();
        driverRegistrationFuncionality = new DriverRegistrationFuncionality(
            context: context,
            names: txtNameDriver.getValue(),
            lastName: txtLastName.getValue(),
            secondLastName: txtSecondLastName.getValue(),
            driverCI: txtDriverCI.getValue(),
            driverLicense: txtDriverLicense.getValue(),
            phone: txtPhoneNumber.getValue(),
            imageDriver: image,
            activeShowDialog: activeShowDialog());
        return true;
      }
      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (registerDataDriver()) {
          driverRegistrationFuncionality.onPressedbtnRegisterDriver();
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
        driverRegistrationFuncionality.onPressedbtnCancelRegisterDriver();
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
        foregroundColor: Colors.black,
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
              Container(
                margin: new EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 130.0, right: 130.0),
                child: Row(
                  children: [
                    Expanded(child: imageDriver),
                  ],
                ),
              ),
              //imageUser,
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
