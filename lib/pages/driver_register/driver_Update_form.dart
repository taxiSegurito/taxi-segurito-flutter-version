import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

class DriverUpdateForm extends StatefulWidget {
  Driver _driver;

  DriverUpdateForm(this._driver);

  _DriverUpdateFormState _state = _DriverUpdateFormState();

  @override
  _DriverUpdateFormState createState() => _state;

  Driver? getDriverIfIsValid() {
    return _state.getDriver();
  }
}

class _DriverUpdateFormState extends State<DriverUpdateForm> {
  late CustomTextField fieldName, fieldLastname, fieldSecondLastname;
  late CustomTextField fieldCi, fieldLicense, fieldCellphone, iddriver;

  Driver getDriver() {
    final name = fieldName.getValue();
    final lastname = fieldLastname.getValue();
    final secondLastname = fieldSecondLastname.getValue();

    return new Driver.update(
      idDriver: widget._driver.idDriver,
      fullName: '$name $lastname $secondLastname',
      cellphone: fieldCellphone.getValue(),
      license: fieldLicense.getValue(),
      ci: fieldCi.getValue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    fieldName = CustomTextField(
      hint: widget._driver.fullName.split(' ')[0],
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El nombre es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldLastname = CustomTextField(
      hint: widget._driver.fullName.split(' ')[1],
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El apellido es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldSecondLastname = new CustomTextField(
      hint: widget._driver.fullName.split(' ')[2],
      multiValidator: MultiValidator([
        StringValidator(errorText: 'No puede ingresar valores numéricos'),
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldCi = new CustomTextField(
      hint: widget._driver.ci,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Número de carnet requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldLicense = new CustomTextField(
      hint: widget._driver.license,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Nivel de licencia de conducir requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos'),
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldCellphone = new CustomTextField(
      hint: widget._driver.cellphone,
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Número de celular requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          SizedBox(height: 18),
          fieldName,
          fieldLastname,
          fieldSecondLastname,
          fieldCi,
          fieldLicense,
          fieldCellphone,
        ],
      ),
    );
  }
}
