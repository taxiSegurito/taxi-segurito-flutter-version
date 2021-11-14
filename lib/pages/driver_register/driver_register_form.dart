import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/providers/ImagesFileAdapter.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

class DriverRegisterForm extends StatefulWidget {
  GlobalKey<FormState> formKey;
  DriverRegisterForm(this.formKey);
  _DriverRegisterFormState _state = _DriverRegisterFormState();

  @override
  _DriverRegisterFormState createState() => _state;

  Driver? getDriverIfIsValid() {
    bool isImageValid = _state.fieldImage.validate();
    bool isFormValid = formKey.currentState!.validate();
    if (isImageValid && isFormValid) {
      return _state.getDriver();
    }
    return null;
  }
}

class _DriverRegisterFormState extends State<DriverRegisterForm> {
  late ImagesFileAdapter fieldImage;
  late CustomTextField fieldName, fieldLastname, fieldSecondLastname;
  late CustomTextField fieldCi, fieldLicense, fieldCellphone;

  Driver getDriver() {
    final name = fieldName.getValue();
    final lastname = fieldLastname.getValue();
    final secondLastname = fieldSecondLastname.getValue();

    return new Driver.insert(
      fullName: '$name $lastname $secondLastname',
      cellphone: fieldCellphone.getValue(),
      license: fieldLicense.getValue(),
      ci: fieldCi.getValue(),
      pictureStr: fieldImage.getImageBase64AsString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    fieldImage = ImagesFileAdapter(
        imagePathDefaultUser: "assets/images/user_default.png",
        isShapeCircle: true);

    fieldName = CustomTextField(
      hint: "Nombre",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El nombre es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldLastname = CustomTextField(
      hint: "Primer apellido",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'El apellido es requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldSecondLastname = new CustomTextField(
      hint: "Segundo apellido",
      multiValidator: MultiValidator([
        StringValidator(errorText: 'No puede ingresar valores numéricos'),
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldCi = new CustomTextField(
      hint: "Número de carnet",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Número de carnet requerido'),
        NumberValidator(errorText: 'No puede ingresar letras')
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldLicense = new CustomTextField(
      hint: "Nivel de licencia de conducir",
      multiValidator: MultiValidator([
        RequiredValidator(errorText: 'Nivel de licencia de conducir requerido'),
        StringValidator(errorText: 'No puede ingresar valores numéricos'),
      ]),
      marginLeft: 0,
      marginRight: 0,
      heightNum: 42,
    );

    fieldCellphone = new CustomTextField(
      hint: "Número de celular",
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
      key: widget.formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 110),
            child: Row(
              children: [
                Expanded(child: fieldImage),
              ],
            ),
          ),
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
