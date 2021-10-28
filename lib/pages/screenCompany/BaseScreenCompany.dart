import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

import 'ScreensCompanyFunctionality.dart';

// ignore: must_be_immutable
abstract class BaseScreenCompany extends StatefulWidget {
  Company company = new Company();
  BaseScreenCompany({Key? key}) : super(key: key);
  @override
  _BaseScreenCompanyState createState() => _BaseScreenCompanyState();

  String titleScreen();
  String textButton();
  void eventAction();
  String tittleDialog();
  ScreensCompanyFunctionality functionality();
}

class _BaseScreenCompanyState extends State<BaseScreenCompany> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);

    ScreensCompanyFunctionality registerCompanyFunctionality =
        widget.functionality();
    registerCompanyFunctionality.context = context;

    Image taxiGif = new Image.asset(
      "assets/images/taxi.gif",
    );

    CustomTextField txtNameCompany = new CustomTextField(
      value: widget.company.companyName,
      hint: 'Nombre Compañia',
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
          StringValidator(errorText: "No se permiten numeros")
        ],
      ),
      assignValue: (value) {
        widget.company.companyName = value;
      },
    );

    CustomTextField txtNit = new CustomTextField(
      value: widget.company.nit,
      hint: "Nit de la empresa",
      multiValidator: MultiValidator(
        [
          RequiredValidator(errorText: "Campo vacio"),
        ],
      ),
      assignValue: (value) {
        widget.company.nit = value;
      },
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
      titleShowDialog: widget.tittleDialog(),
      context: context,
    );

    activeShowDialog() {
      dialogShowRegister.getShowDialog();
    }

    bool isFormValid() {
      if (_formKey.currentState!.validate()) {
        registerCompanyFunctionality.company = widget.company;
        registerCompanyFunctionality.activeShowDialog = activeShowDialog;
        return true;
      }
      return false;
    }

    CustomButton btnGeneric = new CustomButton(
      onTap: () {
        if (isFormValid()) {
          widget.eventAction();
        }
      },
      buttonText: widget.textButton(),
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
      title: Text(
        '',
        textAlign: TextAlign.center,
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );

    Text title = new Text(
      widget.titleScreen(),
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    Container containerTitle = new Container(
      alignment: Alignment.center,
      margin:
          new EdgeInsets.only(top: 40.0, bottom: 30.0, left: 50.0, right: 50.0),
      child: title,
    );
    Container containerTaxiGif = new Container(
      alignment: Alignment.center,
      margin:
          new EdgeInsets.only(top: 40.0, bottom: 30.0, left: 50.0, right: 50.0),
      child: taxiGif,
    );

    Container containerButtons = new Container(
      alignment: Alignment.centerLeft,
      margin:
          new EdgeInsets.only(top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: btnCancel),
          Expanded(flex: 1, child: btnGeneric)
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: appBar,
      //drawer: SideMenu(),
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
                  // autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      containerTitle,
                      containerTaxiGif,
                      txtNameCompany,
                      txtNit,
                      containerButtons,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
