import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/models/client_user.dart';
import 'package:taxi_segurito_app/pages/register/register_info_functionality.dart';
import 'package:taxi_segurito_app/validators/TextFieldValidators.dart';

class RegisterData extends StatefulWidget {
  final String number;
  RegisterData(this.number);
  @override
  _RegisterDataState createState() => new _RegisterDataState(number);
}

class _RegisterDataState extends State<RegisterData> {
  final String number;
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RegisterFunctionality functionality = new RegisterFunctionality();
  FToast fToast = FToast();
  _RegisterDataState(this.number);

  String? validatePassword(value) {
    if (value.isEmpty) {
      return "Confirme su contraseña";
    }
    if (value != password.text) {
      return "La contraseña no coincide";
    }
    return null;
  }

  void modalRegister(BuildContext context) {
    functionality = new RegisterFunctionality.cont(context);
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text(
              "Al registrarte, aceptas los Terminos y Condiciones de uso y Politicas de privacidad de TaxiSegurito.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Relaway'),
            ),
            SizedBox(height: 10),
            Text(
              "Para conocer más, consulta nuestros",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontFamily: 'Relaway'),
            ),
            SizedBox(height: 10),
            Text(
              "Terminos y condiciones de uso",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10, fontFamily: 'relaway', color: Colors.blue),
            ),
            SizedBox(height: 10),
            CustomButton(
                onTap: () async {
                  Clientuser clientuser = Clientuser.insert(
                      fullname: name.text + " " + lastname.text,
                      cellphone: number,
                      email: email.text,
                      password: password.text,
                      signUpType: "email");
                  functionality.registerClient(clientuser);
                },
                buttonText: "REGISTRARSE",
                buttonColor: Colors.amber,
                buttonTextColor: Colors.white),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Expanded(
            child: Container(
              margin: new EdgeInsets.only(top: 0.0, left: 57, right: 57),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formkey,
                child: Column(
                  children: [
                    Text(
                      "Completar registro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Juan José',
                                labelText: 'Nombres',
                                fillColor: Colors.amber,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black)),
                            style: TextStyle(color: Colors.black),
                            controller: name,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Nombre(s) requerido"),
                              MinLengthValidator(
                                3,
                                errorText: "Mínimo 3 caracteres",
                              ),
                              StringValidator(
                                errorText: "No ingrese caracteres numéricos",
                              ),
                            ]),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: 'Perez',
                                labelText: 'Apellidos',
                                fillColor: Colors.amber,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black)),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            controller: lastname,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Apellido(s) requerido"),
                              MinLengthValidator(
                                3,
                                errorText: "Mínimo 3 caracteres",
                              ),
                              StringValidator(
                                errorText: "No ingrese caracteres numéricos",
                              ),
                            ]),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: 'juanperez@gmail.com',
                                labelText: 'Correo',
                                fillColor: Colors.amber,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black)),
                            style: TextStyle(color: Colors.black),
                            controller: email,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Correo requerido"),
                              EmailValidator(errorText: "Correo inválido"),
                            ]),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Contraseña',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            controller: password,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Contraseña requerida"),
                              MinLengthValidator(6,
                                  errorText: "Mínimo 6 caracteres"),
                              MaxLengthValidator(12,
                                  errorText: "Máximo 12 caracteres"),
                            ]),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirmar contraseña',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.red.shade200),
                              ),
                            ),
                            validator: validatePassword,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            modalRegister(context);
          }
        },
        child: const Icon(Icons.arrow_forward_outlined),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
