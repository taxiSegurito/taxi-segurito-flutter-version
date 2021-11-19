import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/models/company.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/pages/owner_register/owner_register_functionality.dart';
import 'package:taxi_segurito_app/pages/owner_register/widgets/DropDownCompany.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

class RegisterOwner extends StatefulWidget {
  Owner owner = Owner.init();
  List<Company> listCompanies = [];
  RegisterOwner({Key? key}) : super(key: key);

  @override
  _RegisterOwnerState createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  RegisterOwnerFunctionality functionality = RegisterOwnerFunctionality();

  @override
  void initState() {
    super.initState();
    functionality.getCompanies().then((value) {
      if (value != null) {
        setState(
          () {
            widget.listCompanies = value;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    functionality.context = context;
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    Text title = new Text(
      "Registro de Dueño",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    DropDownCompany ddbNameCompany = new DropDownCompany(
        hint: "Seleccione empresa", listItem: widget.listCompanies);

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
      assignValue: (value) {
        widget.owner.cellPhone = value;
      },
    );

    CustomTextField txtEmail = new CustomTextField(
      hint: 'Correo electronico',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        EmailValidator(errorText: "Ingrese los parametros correctos")
      ]),
      assignValue: (value) {
        widget.owner.email = value;
      },
    );

    CustomTextField txtPassword = new CustomTextField(
      hint: 'Contraseña',
      obscureText: true,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        PasswordValidator(errorText: "Ingrese parametros correctos")
      ]),
      assignValue: (value) {
        widget.owner.password = value;
      },
    );

    CustomTextField txtAddress = new CustomTextField(
      hint: 'Direccion',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
      assignValue: (value) {
        widget.owner.address = value;
      },
    );

    CustomTextField txtDni = new CustomTextField(
      hint: 'Cedula de identidad',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
      assignValue: (value) {
        widget.owner.ci = value;
      },
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
        ontap: functionality.closeNavigator,
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
        widget.owner.fullName = txtNameOwner.getValue() +
            ' ' +
            txtLastName.getValue() +
            ' ' +
            txtLastNameSecond.getValue();
        functionality.company = ddbNameCompany.getValue();
        functionality.owner = widget.owner;
        functionality.activeShowDialog = activeShowDialog;
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
