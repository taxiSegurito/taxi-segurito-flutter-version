import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwnerFunctionality.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:taxi_segurito_app/pages/registerOwner/widgets/DropDownCompany.dart';

import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

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

    Text title = new Text(
      "Registro de Dueño",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    DropDownCompany ddbNameCompany = new DropDownCompany(
      listItem: registerOwnerFunctionality.getListCompany(),
      hint: "Seleccione empresa",
    );

    CustomTextField txtNameOwner = new CustomTextField(
      hint: 'Nombres',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtLastName = new CustomTextField(
      hint: 'Apellido Paterno',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtLastNameSecond = new CustomTextField(
      hint: 'Apellido Materno',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtPhone = new CustomTextField(
      hint: 'Telefono',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        NumberValidator(errorText: "No se permite letras")
      ]),
    );

    CustomTextField txtEmail = new CustomTextField(
      hint: 'Correo electronico',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        EmailValidator(errorText: "Ingrese los parametros correctos")
      ]),
    );

    CustomTextField txtPassword = new CustomTextField(
      hint: 'Contraseña',
      obscureText: true,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        PasswordValidator(errorText: "Ingrese parametros correctos")
      ]),
    );
    CustomTextField txtAddress = new CustomTextField(
      hint: 'Direccion',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
    );

    CustomTextField txtDni = new CustomTextField(
      hint: 'Cedula de identidad',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
    );

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        registerOwnerFunctionality.onPressedbtnCancelRegisterCar();
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
            company: ddbNameCompany.getValue(),
            names: txtNameOwner.getValue(),
            lastName: txtLastName.getValue(),
            lastNameSecond: txtLastNameSecond.getValue(),
            cellphone: txtPhone.getValue(),
            email: txtEmail.getValue(),
            password: txtPassword.getValue(),
            ci: txtDni.getValue(),
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
