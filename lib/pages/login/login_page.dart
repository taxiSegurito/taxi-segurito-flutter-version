import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/bloc/validators/blocValidate.dart';
import 'package:taxi_segurito_app/bloc/services/authService.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  FToast fToast = FToast();
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
        body: Container(
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
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: StreamBuilder(
                        stream: validator.username,
                        builder: (context, snapshot) {
                          return TextField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "Ingrese su celular o e-mail",
                                errorText: snapshot.error?.toString()),
                            onChanged: validator.changeEmail,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: StreamBuilder(
                        stream: validator.password,
                        builder: (context, snapshot) {
                          return TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                // icon: Icon(Icons.lock),
                                hintText: "Ingrese su Contaseña",
                                errorText: snapshot.error?.toString()),
                            onChanged: validator.changePassword,
                          );
                        },
                      ),
                    ),

                    //

                    // btn Ingresar
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder(
                              stream: validator.submitValid,
                              builder: (context, snapshot) {
                                // funcionalidad de que el boton se deshabilite cuando hayan datos incorrectos no funciona
                                return new CustomButton(
                                  onTap: snapshot.hasData
                                      ? () async {
                                          User us = User(
                                              validator
                                                  .usernameController.value,
                                              validator
                                                  .passwordController.value);
                                          final result = await login(us);
                                          if (result) {
                                            GlobalToast.displayToast(
                                                Text("Bienvenido"),
                                                Colors.greenAccent,
                                                Icon(Icons.check),
                                                2);
                                          } else {
                                            GlobalToast.displayToast(
                                                Text("Datos Incorrectos"),
                                                Colors.redAccent,
                                                Icon(Icons.error),
                                                2);
                                          }
                                        }
                                      : () {
                                          return null;
                                        },
                                  buttonText: "    Ingresar    ",
                                  buttonColor: Colors.yellow.shade600,
                                  buttonTextColor: Colors.black,
                                );
                              },
                            )
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
                                    style: TextStyle(color: Colors.blueAccent)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
