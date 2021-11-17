import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';
import './driver_register_form.dart';

class DriverEditForm extends DriverRegisterForm {
  Driver driver;
  DriverEditForm(GlobalKey<FormState> formKey, this.driver) : super(formKey);

  @override
  _DriverEditFormState createState() => _DriverEditFormState();
}

class _DriverEditFormState extends DriverRegisterFormState<DriverEditForm> {
  late CustomTextField fullnameField;

  _DriverEditFormState() : super();

  @override
  void initState() {
    super.initState();
    fullnameField = CustomTextField(
      hint: "Nombre",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El nombre es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
      value: widget.driver.fullName,
    );

    super.fieldCi.value = widget.driver.ci;
    super.fieldLicense.value = widget.driver.license;
    super.fieldCellphone.value = widget.driver.cellphone;
    super.fieldImage.imageMainBase64 =
        stringFromBase64Bytes(widget.driver.picture);
    super.fieldImage.imagePathDefaultUser = '';
  }

  @override
  String get fullname {
    return fullnameField.getValue();
  }

  @override
  Widget get nameFields => fullnameField;
}
