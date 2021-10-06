import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:taxi_segurito_app/models/person.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/pages/register/register_info_functionality.dart';

class RegisterData extends StatefulWidget {
  final String number;
  RegisterData(this.number);
  @override
  _RegisterDataState createState() => new _RegisterDataState(number);
}

class _RegisterDataState extends State<RegisterData> {
  final String number;
  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  RegisterFunctionality registerFunctionality = new RegisterFunctionality();
  _RegisterDataState(this.number);

  void modalRegister(BuildContext context) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Al registrarte, aceptas los Terminos y Condiciones de uso y Politicas de privacidad de TaxiSegurito.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontFamily: 'Relaway'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Para conocer más, consulta nuestros",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontFamily: 'Relaway'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Terminos y condiciones de uso",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10, fontFamily: 'relaway', color: Colors.blue),
              ),
              SizedBox(
                height: 10,
              ),
              new CustomButton(
                  onTap: () async {
                    Person person = Person.insert(
                        nombres.text + " " + apellidos.text, number);
                    User user = User.insert(correo.text, password.text);
                    Clientuser clientuser = Clientuser.insert("normal");
                    registerFunctionality.registerClient(
                        person, user, clientuser);
                  },
                  buttonText: "REGISTRARSE",
                  buttonColor: Colors.amber,
                  buttonTextColor: Colors.white),
              SizedBox(
                height: 10,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Expanded(
                  child: Container(
                margin: new EdgeInsets.only(top: 0.0, left: 57, right: 57),
                child: Column(
                  children: [
                    Text(
                      "Ingrese su informacion",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Juanito',
                                labelText: 'Nombres',
                                fillColor: Colors.amber,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black)),
                            style: TextStyle(color: Colors.black),
                            controller: nombres,
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                            controller: apellidos,
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                            controller: correo,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PasswordField(
                            color: Colors.black,
                            inputDecoration: PasswordDecoration(),
                            hintText: 'Contraseña',
                            border: PasswordBorder(
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
                            controller: password,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PasswordField(
                            color: Colors.black,
                            inputDecoration: PasswordDecoration(),
                            hintText: 'Repita su Contraseña',
                            border: PasswordBorder(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => modalRegister(context),
          child: const Icon(Icons.arrow_upward),
          backgroundColor: Colors.amber,
        ));
  }
}
