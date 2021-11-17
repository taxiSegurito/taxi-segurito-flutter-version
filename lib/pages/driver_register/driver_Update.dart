import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/pages/driver_register/driver_Update_form.dart';
import 'package:taxi_segurito_app/services/driver_service.dart';

class DriverUpdate extends StatelessWidget {
  DriversService _driversService = DriversService();
  late DriverUpdateForm form;
  late BuildContext context;

  updateDriver() async {
    Driver? driver = form.getDriverIfIsValid();
    if (driver != null) {
      bool success = await _driversService.update(driver);
      if (success) {
        showDialog('Moldificación exitosa',
            'El conductor ha sido Modificado exitosamente.');
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

    final registerButton = CustomButton(
      onTap: updateDriver,
      buttonText: 'Modificar',
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
        title: Text('Modificar conductor'),
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
                    Expanded(flex: 1, child: registerButton)
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
