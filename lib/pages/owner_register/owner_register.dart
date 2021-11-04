import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/pages/owner_register/owner_register_functionality.dart';
import 'package:taxi_segurito_app/pages/owner_register/widgets/DropDownCompany.dart';
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
    RegisterOwnerFunctionality functionality =
        RegisterOwnerFunctionality(context: context);

    Text title = new Text(
      "Registro de Dueño",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    DropDownCompany ddbNameCompany = new DropDownCompany(
      listItem: functionality.getListCompany(),
      hint: "Seleccione empresa",
    );

    final txtNameOwner = new CustomTextField(
      hint: 'Nombres',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    final txtLastName = new CustomTextField(
      hint: 'Apellido Paterno',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    final txtLastNameSecond = new CustomTextField(
      hint: 'Apellido Materno',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    final txtPhone = new CustomTextField(
      hint: 'Telefono',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        NumberValidator(errorText: "No se permite letras")
      ]),
    );

    final txtEmail = new CustomTextField(
      hint: 'Correo electronico',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        EmailValidator(errorText: "Ingrese los parametros correctos")
      ]),
    );

    final txtPassword = new CustomTextField(
      hint: 'Contraseña',
      obscureText: true,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        PasswordValidator(errorText: "Ingrese parametros correctos")
      ]),
    );

    final txtAddress = new CustomTextField(
      hint: 'Direccion',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
    );

    final txtDni = new CustomTextField(
      hint: 'Cedula de identidad',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
    );

    final btnCancel = new CustomButtonWithLinearBorder(
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

    final dialogShowRegister = new CustomDialogShow(
        ontap: () {
          functionality.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!",
        context: context);
    activeShowDialog() {
      dialogShowRegister.show();
    }

    bool registerDataOwner() {
      bool isValidDdbNameCompany = ddbNameCompany.getIsValid();
      if (_formKey.currentState!.validate() && isValidDdbNameCompany) {
        functionality = new RegisterOwnerFunctionality(
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

    final btnRegister = new CustomButton(
      onTap: () {
        if (registerDataOwner()) {
          functionality.onPressedbtnRegisterCar();
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

    final containerTitle = new Container(
        alignment: Alignment.center,
        margin: new EdgeInsets.only(
          top: 20.0,
          bottom: 10.0,
          left: 35.0,
          right: 35.0,
        ),
        child: title);

    final containerButtons = new Container(
      alignment: Alignment.centerLeft,
      margin:
          new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: btnCancel),
          Expanded(flex: 1, child: btnRegister)
        ],
      ),
    );

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
          ),
        ),
      ),
    );
  }
}
