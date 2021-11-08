
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/pages/recoveryPassword/recoveryPassword_functionality.dart';
import 'package:taxi_segurito_app/pages/updateUserclient/updatePassword.dart';
//import 'package:taxi_segurito_app/bloc/validators/blocValidate.dart';

class RecoveryPassword_page extends StatefulWidget {
  @override
  _RecoveryPasswordState createState() => new _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword_page> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Taxi Segurito"),
          backgroundColor: Colors.yellow,
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
        child : Container(
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
                        padding: const EdgeInsets.only(right: 40,bottom: 10,left: 40),
                        child: Text(
                          "Recupera tu contraseña usando tu correo electrónico",
                          style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'Raleway'),
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
                    // TextField: Email
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
                        controller: email_Controller,
                        decoration: InputDecoration(
                            hintText: "Ingrese su correo electrónico"),
                      ),
                    ),
                    
                    // Button: Enviar Email
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow.shade600),
                                ),
                                onPressed: isEnabledButtons ? btnEnviarEmail : null,
                                child:
                                    Text("        Enviar código a mi correo        "))
                          ],
                        ),
                      ),
                    ),

                    // TextField: Codigo de Verificacion
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
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
                        controller: codeInput_Controller,
                        decoration: InputDecoration(
                          hintText: "Código de verificación",
                        ),
                      ),
                    ),


                    // Button: Confirmar
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
                                onPressed: isEnabledButtons ? btnConfirm : null,
                                child:
                                    Text("             Confirmar            "))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
  
  // METHODS

  // Metodo 1 : Habilita o deshabilita los botones EnviarEmail y Confirmar cuando inicia o termina el proceso.
  enableElevatedButton() {
    setState(() {
      isEnabledButtons = !isEnabledButtons;
      print("confirmarButton: $isEnabledButtons");
    });
  }

  //Metodo 2: Redirecciona a updatePassword_page.dart cuando se ingresa el codeVerify correcto
  btnConfirm()
  {
    if(validateCodeVerify())
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword(lastEmailAux)),);
    }
  }
}