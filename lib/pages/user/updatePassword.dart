import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/pages/user/updatePassword_functionality.dart';

class UpdatePassword extends StatefulWidget {
  String _auxEmail;//Aux para recibir email
  UpdatePassword(this._auxEmail); //Aux para pasar email

  @override
  _UpdatePasswordState createState() => new _UpdatePasswordState(_auxEmail);
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String email;//Aux para recibir email
  _UpdatePasswordState(this.email);

  UpdatePasswordFuncionality updatePasswordFuncionality = new UpdatePasswordFuncionality();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                          "Cambio contraseña",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // TextField NewPassword
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: updatePasswordFuncionality.newPassword_Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Ingrese nueva contraseña"),
                      ),
                    ),

                    // TextField RepeatPassword
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: updatePasswordFuncionality.repeatNewPassword_Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Repita su nueva contraseña",
                        ),
                      ),
                    ),

                    // btn Cambiar contraseña
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow.shade600),
                                ),
                                onPressed: () {
                                      updatePasswordFuncionality.onPressedBtnCambiarContrasena(email);
                                },
                                child:
                                    Text("        Cambiar Contraeña        "))
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

