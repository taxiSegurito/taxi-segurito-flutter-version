import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwnerFunctionality.dart';
import 'package:taxi_segurito_app/providers/ImagesFile.dart';
import 'package:taxi_segurito_app/components/inputs/CustomDropdownButton.dart';

import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicleFunctionality.dart';

class RegisterOwner extends StatefulWidget {
  RegisterOwner({Key? key}) : super(key: key);

  @override
  _RegisterOwnerState createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterOwnerFunctionality registerOwnerFunctionality =
        new RegisterOwnerFunctionality(context: context);

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = new Text(
      "Registro de Dueño",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    CustomDropdownButton ddbNameCompany = new CustomDropdownButton(
      listItem: registerOwnerFunctionality.getListCompany(),
      hint: "Seleccione empresa",
    );

    CustomTextField txtNameOwner = new CustomTextField(
      hint: "Nombres",
      isValidName: true,
    );

    CustomTextField txtLastName = new CustomTextField(
      hint: "Apellido Paterno",
      isValidName: true,
    );

    CustomTextField txtLastNameSecond = new CustomTextField(
      hint: "Apellido Paterno",
      isValidName: true,
    );

    CustomTextField txtPhone = new CustomTextField(
      hint: "Telefono",
      isValidPhone: true,
    );

    CustomTextField txtEmail = new CustomTextField(
      hint: "Correo Electronico",
      isValidEmail: true,
    );

    CustomTextField txtPassword = new CustomTextField(
      hint: "Contraseña",
      isValidEmail: true,
    );

    CustomTextField txtAddress = new CustomTextField(
      hint: "Direccion",
      isValidEmail: true,
    );

    CustomTextField txtDni =
        new CustomTextField(hint: "Documento de identidad");

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

    CustomDialogShow dialogShowRegister = new CustomDialogShow(
        ontap: () {
          registerOwnerFunctionality.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!",
        context: context);
    activeShowDialog() {
      dialogShowRegister.getShowDialog();
    }

    bool registerDataOwner() {
      bool isValidDdbNameCompany = ddbNameCompany.getIsValid();
      if (_formKey.currentState!.validate() && isValidDdbNameCompany) {
        registerOwnerFunctionality = new RegisterOwnerFunctionality(
            nameCompany: ddbNameCompany.getValue(),
            names: txtNameOwner.getValue(),
            lastName: txtLastName.getValue(),
            lastNameSecond: txtLastNameSecond.getValue(),
            phone: txtPhone.getValue(),
            email: txtEmail.getValue(),
            password: txtPassword.getValue(),
            dni: txtDni.getValue(),
            address: txtAddress.getValue(),
            context: context,
            activeShowDialog: activeShowDialog);
        return true;
      }
      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (registerDataOwner()) {
          registerOwnerFunctionality.onPressedbtnRegisterCar();
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
              child: Expanded(
                child: Column(
                  children: [
                    containerTitle,
                    ddbNameCompany,
                    txtNameOwner,
                    txtLastName,
                    txtLastNameSecond,
                    txtPhone,
                    txtEmail,
                    txtPassword,
                    txtDni,
                    txtAddress,
                    containerButtons
                  ],
                ),
              )),
        ));
  }
}
