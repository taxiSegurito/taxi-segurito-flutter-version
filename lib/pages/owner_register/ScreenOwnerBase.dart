import 'dart:convert';
import 'dart:developer';

import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/models/Owner.dart';
import 'package:taxi_segurito_app/pages/owner_register/widgets/DropDownCompany.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';
import 'owner_register_functionality.dart';

abstract class ScreenOwnerBase extends StatefulWidget {
  _ScreenOwnerBaseState _screenOwnerBaseState = new _ScreenOwnerBaseState();

  Owner owner = new Owner.init();

  Company company = new Company();

  List<Company> listCompanies = [];
  @override
  State<ScreenOwnerBase> createState() {
    return _screenOwnerBaseState;
  }

  String tittleScreen();

  String tittleDialog();

  RegisterOwnerFunctionality functionality();

  String textButtom();

  String textDeleteButton();

  eventActionUpdate();

  eventActionDelete();
}

class _ScreenOwnerBaseState extends State<ScreenOwnerBase> {
  RegisterOwnerFunctionality? functionality;
  @override
  void initState() {
    super.initState();
    functionality = widget.functionality();
    functionality!.getCompanies().then((value) {
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
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    functionality!.setContext = context;

    Text title = new Text(
      widget.tittleScreen(),
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    DropDownCompany ddbNameCompany = new DropDownCompany(
      value: widget.company,
      listItem: widget.listCompanies,
      hint: "Seleccione empresa",
    );

    CustomTextField txtNameOwner = new CustomTextField(
      value: widget.owner.fullName.split(' ')[0],
      hint: 'Nombres',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtLastName = new CustomTextField(
      value: widget.owner.fullName.split(' ')[1],
      hint: 'Apellido Paterno',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtLastNameSecond = new CustomTextField(
      value: widget.owner.fullName.split(' ')[2],
      hint: 'Apellido Maternos',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        StringValidator(errorText: "No se permite numeros")
      ]),
    );

    CustomTextField txtPhone = new CustomTextField(
      value: widget.owner.cellPhone,
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
      value: widget.owner.email,
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
      value: widget.owner.password,
      hint: 'Contraseña',
      obscureText: true,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
        //PasswordValidator(errorText: "Ingrese parametros correctos")
      ]),
      assignValue: (value) {
        widget.owner.password = value;
      },
    );
    CustomTextField txtAddress = new CustomTextField(
      value: widget.owner.address,
      hint: 'Direccion',
      multiValidator: MultiValidator([
        RequiredValidator(errorText: "Campo vacio"),
      ]),
      assignValue: (value) {
        widget.owner.address = value;
      },
    );

    CustomTextField txtDni = new CustomTextField(
      value: widget.owner.ci,
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
        functionality!.onPressedbtnCancelRegisterCar();
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
          functionality!.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: widget.tittleDialog(),
        context: context);
    activeShowDialog() {
      dialogShowRegister.show();
    }

    bool validateForm() {
      bool isValidDdbNameCompany = ddbNameCompany.getIsValid();
      if (_formKey.currentState!.validate() && isValidDdbNameCompany) {
        widget.owner.fullName = txtNameOwner.getValue() +
            ' ' +
            txtLastName.getValue() +
            ' ' +
            txtLastNameSecond.getValue();
        functionality!.company = ddbNameCompany.getValue();
        functionality!.owner = widget.owner;
        functionality!.activeShowDialog = activeShowDialog;
        return true;
      }
      return false;
    }

    CustomButton btnGeneric = new CustomButton(
      onTap: () {
        if (validateForm()) {
          this.widget.eventActionUpdate();
        }
      },
      buttonText: widget.textButtom(),
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
