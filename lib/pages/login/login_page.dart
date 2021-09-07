import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/bloc/blocValidate.dart';
import 'package:taxi_segurito_app/bloc/userBloc.dart';
import 'package:taxi_segurito_app/models/usuario.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Taxi Segurito"),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => print("Ir Atras"),
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
                        stream: bloc.username,
                        builder: (context, snapshot) {
                          return TextField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                //icon: Icon(Icons.account_box_outlined),
                                hintText: "Ingrese su celular o e-mail",
                                errorText: snapshot.error?.toString()),
                            onChanged: bloc.changeEmail,
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
                        stream: bloc.password,
                        builder: (context, snapshot) {
                          return TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                // icon: Icon(Icons.lock),
                                hintText: "Ingrese su Contaseña",
                                errorText: snapshot.error?.toString()),
                            onChanged: bloc.changePassword,
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
                              stream: bloc.submitValid,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.yellow.shade600),
                                    ),
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            Usuario us = Usuario(
                                                bloc.usernameController.value,
                                                bloc.passwordController.value);
                                            final result = await login(us);
                                            if (result) {
                                              print("Bienvenido");
                                              FToast fToast = FToast();
                                              fToast.init(context);
                                              fToast.showToast(
                                                child: toast,
                                                toastDuration:
                                                    Duration(seconds: 2),
                                              );
                                            } else {
                                              print("Datos Incorrectos");
                                              FToast fToast = FToast();
                                              fToast.init(context);
                                              fToast.showToast(
                                                child: errorToast,
                                                toastDuration:
                                                    Duration(seconds: 2),
                                              );
                                            }
                                          }
                                        : null,
                                    child: Text(
                                        "             Ingresar            "));
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

  Widget toast = Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Bienvenido"),
        ],
      ),
    ),
  );

  Widget errorToast = Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error),
          SizedBox(
            width: 12.0,
          ),
          Text("Datos Invalidos"),
        ],
      ),
    ),
  );
}
