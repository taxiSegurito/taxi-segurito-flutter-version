import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/pages/driver_register/driver_edit_form.dart';
import 'package:taxi_segurito_app/services/driver_service.dart';

class DriverEdit extends StatelessWidget {
  DriversService _driversService = DriversService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DriverEditForm form;
  late BuildContext context;
  late Driver _driver;

  DriverEdit(this._driver) {
    form = DriverEditForm(_formKey, _driver);
  }

  updateDriver() async {
    Driver? driver = form.getDriverIfIsValid();
    if (driver != null) {
      bool success = await _driversService.update(driver);
      if (success) {
        showDialog('Actualización exitosa',
            'Se han guardado los cambios exitosamente.');
      } else {
        showDialog('Ups!', 'Ha ocurrido un problema, inténtelo de nuevo.');
      }
    }
  }

  showDialog(String text, String content) {
    final dialog = CustomDialogShow(
      buttonText: 'Ok',
      context: context,
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonColorText: Colors.white,
      titleShowDialog: text,
      message: content,
    );

    dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final updateButton = CustomButton(
      onTap: updateDriver,
      buttonText: 'Guardar cambios',
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 5,
      marginRight: 0,
      marginTop: 0,
    );

    final cancelButton = CustomButton(
      onTap: () => Navigator.pop(context),
      buttonText: 'Cancelar',
      buttonColor: Colors.white,
      buttonTextColor: Color.fromRGBO(255, 193, 7, 1),
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Editar datos de conductor'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          // height: constraints.maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              form,
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: cancelButton),
                    Expanded(flex: 1, child: updateButton)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
