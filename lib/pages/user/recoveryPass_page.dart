import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart'; //Enviar correo
import 'package:mailer/smtp_server.dart'; //Enviar correo
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';  //Verificar correo
import 'package:taxi_segurito_app/pages/user/updatePassword.dart';
import 'dart:convert';

class RecoveryPass extends StatefulWidget {
  @override
  _RecoveryPassState createState() => new _RecoveryPassState();
}

class _RecoveryPassState extends State<RecoveryPass> {
  //Email Variables
  var email_Controller = '';
  var lastEmailAux = '';
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
                                onPressed: _isEnabled ? goUpdatePassword : null,
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
    lastEmailAux = email_Controller;
    if(lastEmailAux == "") //Si email no esta vacio
    {
        Fluttertoast.showToast(
        msg: "Debe ingresar su correo.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.yellow,
        textColor: Colors.white);
    }
    else{
      final bool _isValid = EmailValidator.validate(lastEmailAux);
      if(_isValid) //Si el email es real, verificamos si est registrado
      {
        checkEmailOnDatabase(lastEmailAux).toString();
      }
      else //Si no es real
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
  //METODOS PRUEBA
  checkEmailOnDatabase(email) async
  {
    var url ="https://taxi-segurito.000webhostapp.com/flutter_api/checkEmail.php";
    var response = await http.post(Uri.parse(url),body:{
      "email" : email,

    });

    String data =json.decode(response.body);
    print("2 data: "+data);
    ValidateOnDatabase(data);
  }
  //Metodo para confirmar el codigo de verificacion e ir a updatePassword.dart
  goUpdatePassword()
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword(email_Controller)),);
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
  ValidateOnDatabase(String _checkEmail)
  {
        if(_checkEmail == "AlreadyExists") //Si ya esta registrado, enviamos correo
        {
          Fluttertoast.showToast(
          msg: "Enviando...",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);

          SendEmail_Function(email_Controller);
          enableElevatedButton();
        }
        else                        //Si no
        {
          print("333: "+_checkEmail.toString());
           if(_checkEmail.toString() != "NoExist") //Avisamos que no exist o...
           {
              Fluttertoast.showToast(
              msg: "Este correo no está registrado.",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white);
           }
           else                       //si no se pudo realizar la consulta
           {
             print("44: "+_checkEmail.toString());
             print(_checkEmail);
              Fluttertoast.showToast(
              msg: "Error en la base de datos.",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white);
           }
        }

  }

}