import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/Company.dart';
import 'package:taxi_segurito_app/pages/registerCompany/RegisterCompanyFunctionality.dart';

class RegisterCompany extends StatefulWidget {
  RegisterCompany({Key? key}) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompany> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterCompanyFunctionality registerCompanyFunctionality =
        new RegisterCompanyFunctionality(context: context);

    Text title = new Text(
      "Registro de Empresa",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    CustomTextField txtNameCompany = new CustomTextField(
      hint: "Nombre Compania",
    );

    CustomTextField txtNit = new CustomTextField(
      hint: "Nit de la empresa",
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

    AppBar appBar = new AppBar(
      backgroundColor: colorMain,
      elevation: 0,
      title: Text(
        'Registro de dueño',
        textAlign: TextAlign.center,
      ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        containerTitle,
                        txtNameCompany,
                        txtNit,
                        containerButtons
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
