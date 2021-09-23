import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';

class DriverRegistration extends StatefulWidget {
  DriverRegistration({Key? key}) : super(key: key);

  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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

    CustomTextField txtNameDriver = new CustomTextField(hint: "Nombres");
    CustomTextField txtLastName = new CustomTextField(hint: "Primer apellido");
    CustomTextField txtSecondSurname =
        new CustomTextField(hint: "Segundo apellido");
    CustomTextField txtDriverIdentityDocument = new CustomTextField(
      hint: "Documento de identidad",
    );
    CustomTextField txtDateOfBirth =
        new CustomTextField(hint: "Fecha de Nacimiento");
    CustomTextField txtNationality = new CustomTextField(hint: "Nacionalidad");
    CustomTextField txtPhoneNumber = new CustomTextField(hint: "Teléfono");

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
        if (_formKey.currentState!.validate()) {}
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ));
            },
          ),
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
                            top: 50.0, bottom: 20.0, left: 50.0, right: 35.0),
                        child: title),
                    txtNameDriver,
                    txtLastName,
                    txtSecondSurname,
                    txtDriverIdentityDocument,
                    txtDateOfBirth,
                    txtNationality,
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
