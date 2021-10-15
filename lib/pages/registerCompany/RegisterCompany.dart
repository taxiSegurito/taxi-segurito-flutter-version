import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompanyFunctionality.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

class RegisterCompany extends StatefulWidget {
  Company? company;
  RegisterCompany({Key? key}) : super(key: key);
  RegisterCompany.fromRegisterCompany({Key? key, this.company})
      : super(key: key);
  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompany> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterCompanyFunctionality registerCompanyFunctionality =
        new RegisterCompanyFunctionality(context: context);
    String textTitle = "Registro de Empresa";

    CustomTextField txtNameCompany = new CustomTextField(
      hint: 'Nombre Compañia',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          StringValidator(errorText: "No se permiten numeros")
        ],
      ),
    );

    CustomTextField txtNit = new CustomTextField(
      hint: "Nit de la empresa",
      multiValidator: MultiValidator(
        [RequiredValidator(errorText: "Campo vacio")],
      ),
    );

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        registerCompanyFunctionality.onPressedBtnCancel();
      },
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: colorMain,
      buttonBorderColor: colorMain,
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );

    CustomDialogShow dialogShowRegister = new CustomDialogShow(
        ontap: () {
          registerCompanyFunctionality.closeNavigator();
        },
        buttonText: "Aceptar",
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!",
        context: context);

    activeShowDialog() {
      dialogShowRegister.getShowDialog();
    }

    bool registerDataCompany() {
      if (_formKey.currentState!.validate()) {
        registerCompanyFunctionality = new RegisterCompanyFunctionality(
            nameCompany: txtNameCompany.getValue(),
            nit: txtNit.getValue(),
            context: context,
            activeShowDialog: activeShowDialog);
        return true;
      }
      return false;
    }

    bool registerUpdateDataCompany() {
      if (_formKey.currentState!.validate()) {
        registerCompanyFunctionality = new RegisterCompanyFunctionality(
            idCompany: widget.company!.idCompany,
            nameCompany: txtNameCompany.getValue(),
            nit: txtNit.getValue(),
            context: context,
            activeShowDialog: activeShowDialog);
        return true;
      }
      return false;
    }

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (registerDataCompany()) {
          registerCompanyFunctionality.onPressedBtnRegister();
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

    updateData() {
      if (widget.company != null) {
        txtNameCompany.value = widget.company!.companyName;
        txtNit.value = widget.company!.nit;
        btnRegister.buttonText = "Actualizar";
        btnRegister.onTap = () {
          if (registerUpdateDataCompany()) {
            registerCompanyFunctionality.onPressedBtnUpdate();
          }
        };
        textTitle = "Actualizar Empresa";
      }
    }

    updateData();

    AppBar appBar = new AppBar(
      backgroundColor: colorMain,
      elevation: 0,
      title: Text(
        'Registro de dueño',
        textAlign: TextAlign.center,
      ),
    );

    Text title = new Text(
      textTitle,
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    Container containerTitle = new Container(
        alignment: Alignment.center,
        margin: new EdgeInsets.only(
            top: 40.0, bottom: 30.0, left: 35.0, right: 35.0),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Container(
                      alignment: Alignment.center,
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            containerTitle,
                            txtNameCompany,
                            txtNit,
                            containerButtons,
                          ],
                        ),
                      )))
            ],
          ),
        ));
  }
}
