import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu_owner.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistrationFuncionality.dart';
import 'package:taxi_segurito_app/providers/ImagesFile.dart';

class DriverRegistration extends StatefulWidget {
  DriverRegistration({Key? key}) : super(key: key);

  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  @override
  Widget build(BuildContext context) {
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    final _formKey = GlobalKey<FormState>();
    DriverRegistrationFuncionality driverRegistrationFuncionality;
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
      isValidString: true,
      msgValidString: "No puede ingresar números en su nombre",
    );
    CustomTextField txtLastName = new CustomTextField(
      hint: "Primer apellido",
      isValidString: true,
      msgValidString: "No puede ingresar números en su primer apellido",
    );
    CustomTextField txtSecondLastName = new CustomTextField(
      hint: "Segundo apellido",
      isValidString: true,
      msgValidString: "No puede ingresar números",
    );
    CustomTextField txtDriverCI = new CustomTextField(
      hint: "Número de carnet",
    );
    CustomTextField txtDriverLicense = new CustomTextField(
      hint: "Número de licencia de conducir",
      isValidNumber: true,
      msgValidNumber: "No puede ingresar letras en su número de licencia",
    );
    CustomTextField txtPhoneNumber = new CustomTextField(
      hint: "Número de celular",
      isValidNumber: true,
      msgValidNumber: "No puede ingresar letras en su número de celular",
    );

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

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
        if (_formKey.currentState!.validate()) {
          driverRegistrationFuncionality = new DriverRegistrationFuncionality(
              txtNameDriver.getValue(),
              txtLastName.getValue(),
              txtSecondLastName.getValue(),
              txtDriverCI.getValue(),
              txtDriverLicense.getValue(),
              txtPhoneNumber.getValue());
          driverRegistrationFuncionality.onPressedbtnRegisterDriver();
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

    return Scaffold(
        appBar: AppBar(),
        drawer: SideMenuOwner(),
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
                        )),
                  ],
                ))));
  }
}
