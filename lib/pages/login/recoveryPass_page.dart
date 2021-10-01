import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:mailer/mailer.dart'; //Enviar correo
import 'package:mailer/smtp_server.dart'; //Enviar correo
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart'; //Verificar correo

class RecoveryPass extends StatefulWidget {
  @override
  _RecoveryPassState createState() => new _RecoveryPassState();
}

class _RecoveryPassState extends State<RecoveryPass> {
  //Email Variables
  var email_Controller = '';
  var codeInput_Controller = '';
  var codeVerify = '';
  //Disable button "confirmar" variables;
  bool _isEnabled = true;

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
                          "Recupera tu contraseña usando tu correo electrónico",
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
                    // TextField email
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
                        onChanged: (text) {email_Controller = text;},
                        decoration: InputDecoration(
                            //icon: Icon(Icons.account_box_outlined),
                            hintText: "Ingrese su correo electrónico"),
                      ),
                    ),
                    
                    // btn Enviar email
                    Container(
                      padding: EdgeInsets.only(top: 30),
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
                                onPressed: _isEnabled ? DisableAndSend : null, //Envia un email con un codigo aleatorio al email ingresado
                                child:
                                    Text("        Enviar código a mi correo        "))
                          ],
                        ),
                      ),
                    ),
                    // TextField Codigo de Verificacion
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
                        onChanged: (text) {codeInput_Controller = text;},
                        decoration: InputDecoration(
                          hintText: "Código de verificación",
                        ),
                      ),
                    ),


                    // btn Confirmar
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
                                onPressed: _isEnabled ? changePassword : null,
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
        ));
  }
  //Metodso para enviar email con codigo
  void DisableAndSend()
  {
        Fluttertoast.showToast(
        msg: "Enviando...",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white);
    if(email_Controller == "") //Si email no esta vacio
    {
        Fluttertoast.showToast(
        msg: "Debe ingresar su correo.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.yellow,
        textColor: Colors.white);
    }
    else{
      final bool _isValid = EmailValidator.validate(email_Controller);
      if(_isValid) //Si el email existe
      {
        SendEmail_Function(email_Controller);
        enableElevatedButton();
      }
      else //Si no existe
      {
        Fluttertoast.showToast(
        msg: "El correo no existe.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
      }
    }

  }
SendEmail_Function(emailTo) async {
  /*IMPORTANTE: El email de taxi segurito debe tener activado la opcion "permitir aplicaciones menos seguras",
    si esta funcionalidad no se usa en mucho tiempo, la opcion se deshabilitará sola, se habilita en "Cuenta->Seguridad->App menos seguras"
  */
  String username = 'taxisegurito2021@gmail.com'; // Nuestro email de la app
  String password = 'taxi54321';                      // Contraseña del email de la app
  print(username);
  print(password);
  final smtpServer = gmail(username, password);

  //Generar código de verificacion
  var rng = new Random();
  for (var i = 0; i < 6; i++) {
    codeVerify += rng.nextInt(10).toString();
  }
  print("Codigo de verificacion: "+codeVerify);
  // Contruir el email
  final message = Message()
    ..from = Address(username, 'Taxi Segurito')
    ..recipients.add(emailTo)
    ..subject = 'App Taxi Segurito'
    ..text = '$codeVerify \nIngresa este código para restablecer tu contraseña';

  try {//Si logra enviar el email
    final sendReport = await send(message, smtpServer); //Envia el email
    print('Message sent: ' + sendReport.toString());
    Fluttertoast.showToast(
        msg: "¡Correo enviado!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  
  } on MailerException catch (e) {
    //Si NO logra enviar el email
        Fluttertoast.showToast(
        msg: "No se pudo enviar el email :(",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  finally { enableElevatedButton();}
  var connection = PersistentConnection(smtpServer);
  //await connection.send(message); // Envia el email
  await connection.close(); // Cierra la conexion
  }
  //Metodo para deshabilitar/habilitar boton "confirmar"
  enableElevatedButton() {
    setState(() {
      _isEnabled = !_isEnabled;
      print("confirmarButton: $_isEnabled");
    });
  }
  //Metodo para confirmar el cambio de contraseña
  changePassword()
  {
    if(codeInput_Controller == "")
    {
        Fluttertoast.showToast(
        msg: "Ingrese el código de verificación.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.yellow,
        textColor: Colors.white);
    }
    else{
      if(codeVerify == codeInput_Controller)
      {
        // TEMPORAL REEMPLAZAR POR CONSULTA A LA BDD PARA MODIFICAR
        Fluttertoast.showToast(
        msg: "*Se va a otra ventana.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
      }
      else
      {
        Fluttertoast.showToast(
        msg: "Código de verificación inválido.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
      }
    }
  }

}