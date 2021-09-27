import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/providers/imageAccessProvider.dart';

class DriverRegistration extends StatefulWidget {
  DriverRegistration({Key? key}) : super(key: key);

  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  String _date = '';
  TextEditingController _inputFieldDateControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Text title = Text(
      "Registrar Conductor",
      style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontFamily: "Raleway",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.justify,
    );

    Image imageAuto = new Image.asset(
      "lib/components/assets/images/user.png",
      height: 150,
      width: 150,
    );

    ImageAccessProvider imageAccessProvider =
        new ImageAccessProvider(context: context);

    CustomTextField txtNameDriver = new CustomTextField(
      hint: "Nombres",
      isValidName: true,
    );
    CustomTextField txtLastName = new CustomTextField(
      hint: "Primer apellido",
      isValidLastName: true,
    );
    CustomTextField txtSecondSurname = new CustomTextField(
      hint: "Segundo apellido",
      isValidSecondLastName: true,
    );
    CustomTextField txtDriverIdentityDocument = new CustomTextField(
      hint: "Documento de identidad",
      isValidCI: true,
    );
    CustomTextField txtNationality = new CustomTextField(
      hint: "Nacionalidad",
      isValidNationality: true,
    );
    CustomTextField txtPhoneNumber = new CustomTextField(
      hint: "Teléfono",
      isValidPhone: true,
    );

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {},
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: Color.fromRGBO(255, 193, 7, 1),
      buttonBorderColor: Color.fromRGBO(255, 193, 7, 1),
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          () => _showAlert(context);
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

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ));
            },
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 50.0, right: 35.0),
                        child: title),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageAuto.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () {
                              imageAccessProvider.openGalery().then((_) {
                                setState(() {
                                  imageAuto = Image.file(
                                      imageAccessProvider.getImage());
                                });
                              });
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    txtNameDriver,
                    txtLastName,
                    txtSecondSurname,
                    txtDriverIdentityDocument,
                    _createDate(context),
                    txtNationality,
                    txtPhoneNumber,
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.only(
                            top: 38.0, bottom: 10.0, left: 50.0, right: 50.0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: btnCancel),
                            Divider(),
                            Expanded(flex: 1, child: btnRegister)
                          ],
                        )),
                  ],
                ))));
  }

  Widget _createDate(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(5),
      width: 290,
      height: 36,
      child: new TextField(
        style: new TextStyle(fontSize: 13.0),
        enableInteractiveSelection: false,
        controller: _inputFieldDateControler,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1930),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateControler.text = _date;
      });
    }
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Titulo'),
            content: Text('Contenido'),
          );
        });
  }
}
