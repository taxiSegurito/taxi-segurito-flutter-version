import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/pages/recoveryPassword/recoveryPasswordFunctionality.dart';

class RecoveryPassword extends StatefulWidget {

  @override
  RecoveryPasswordState createState() => new RecoveryPasswordState();
}

class RecoveryPasswordState extends State<RecoveryPassword> {
  late RecoveryPasswordFuncionality recoveryPasswordFuncionality;
  @override
  void initState() {
    super.initState();
    recoveryPasswordFuncionality = new RecoveryPasswordFuncionality(context);
  }
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
                        controller: recoveryPasswordFuncionality.email_Controller,
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
                                onPressed: (){
                                  if(recoveryPasswordFuncionality.isEnabledButtons)
                                  {
                                    recoveryPasswordFuncionality.onPressedBtnEnviarEmail();
                                  }
                                 },
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
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: recoveryPasswordFuncionality.codeInput_Controller,
                        decoration: InputDecoration(
                          hintText: "Código",
                        ),
                      ),
                    ),


                    // Button: Confirmar
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
                                onPressed: (){
                                  if(recoveryPasswordFuncionality.isEnabledButtons)
                                  {
                                    recoveryPasswordFuncionality.onPressedBtnConfirmar(); 
                                  }
                                 },
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
}