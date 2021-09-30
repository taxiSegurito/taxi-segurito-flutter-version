import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialogMenu.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _keyForm = GlobalKey<FormState>(); //De validacion
  @override
  Widget build(BuildContext context) {
    CustomShowDialogMenu showMenu = new CustomShowDialogMenu(
        context: context,
        titleShowDialog: "¿Que deseas registrar?",
        ontapButtonOne: () {
          Navigator.pushNamed(context, 'registerVehicle');
        },
        buttonOneText: "Registrar Vehiculo",
        ontapButtonTwo: () {
          Navigator.pushNamed(context, 'registerCompany');
        },
        buttonTwoText: "Registrar Empresa",
        buttonTwoColor: Colors.white,
        buttonTextTwoColor: Colors.black,
        ontapButtonThree: () {
          Navigator.pushNamed(context, 'registerOwner');
        },
        buttonThreeText: "Registrar Dueño");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Taxi Segurito"),
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Form(
                    key: _keyForm, //Haciendo validaciones
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 1)
                              ]),
                          child: TextFormField(
                            validator: (valor) {
                              if (valor!.isEmpty) {
                                //Vacio
                                return 'Numero de documento vacio';
                              }
                              if (valor.isValidEmail) {
                                return null;
                              } else {
                                return 'Los datos son incorrectos';
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                //icon: Icon(Icons.account_box_outlined),
                                hintText: "Ingrese su celular o e-mail"),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 38,
                          margin: EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 1)
                              ]),
                          child: TextFormField(
                            validator: (valor) {
                              if (valor!.isEmpty) {
                                //Vacio
                                return 'Numero de documento vacio';
                              }
                              if (valor.isValidPassword) {
                                return null;
                              } else {
                                return 'Ingrese contraseña con Mayuscula Numeros gestos';
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.lock),
                              hintText: "Ingrese su Contaseña",
                            ),
                          ),
                        ),
                        // btn Ingresar
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Container(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.yellow.shade600),
                                    ),
                                    onPressed: () {
                                      //showMenu.showAlertDialog();
                                      Navigator.pushNamed(
                                          context, "menuButtonsRegister");
                                      /*if (_keyForm.currentState!.validate()) {
                                        print("-- validacion Exitosa");
                                      } else {
                                        print("-- Ha ocurrido un error");
                                      }*/
                                    },
                                    child: Text(
                                        "             Ingresar            "))
                              ],
                            ),
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Container(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Olvidaste tu contraseña?",
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

/**
 * //DATA PICKER
 * 
 * showDatePicker(
 *  context: context,
 *  initialDate: DateTime.nom(),
 *  firstDate: DateTime(2001),
 *  lastDate: DateTime(2022)
 *  ).then((date){
 *  setState((date){
 *    _dateTime = date;});
 *  });
 * 
 * 
 * 
 * 
 * 
 * 
 * */
