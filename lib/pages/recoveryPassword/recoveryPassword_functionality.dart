
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/email/EmailSender.dart';
import 'dart:convert';
import 'dart:math';

//Link database
final domain ="192.168.0.14";  //final db ="https://taxi-segurito.000webhostapp.com/flutter_api/";
final path = "/taxisegu/app/api/user/";
  
TextEditingController email_Controller = TextEditingController();
TextEditingController codeInput_Controller = TextEditingController();
var lastEmailAux = '';
var codeVerify = '';
var isEnabledButtons = true;

// UI FUNCTIONS

  /// Function 1: Envia un email con condigo de verificacion al email ingresado en email_Controler.
  btnEnviarEmail()
  {
    if(email_Controller.text == "")
    {
        GlobalToast.displayToast(Text("Debe ingresar su correo."), Colors.yellow, Icon(Icons.warning), 3);
    }
    else
    {
      codeVerify = generateVerifyCode();
      lastEmailAux = email_Controller.text;
      if(comprobateIsValid(lastEmailAux))
      {
        comprobateIsRegistered(lastEmailAux);
      }
    }
  }

  ///Function 2: Retorna un codigo de numeros aleatorios de tamaño 6.
  String generateVerifyCode()
  {
    String codeAux = '';
    Random rng = new Random();
    for (int i = 0; i < 6; i++) {
      codeAux += rng.nextInt(10).toString();
    }
    return codeAux;
  }

  ///Function 3: Comprueba si un email es real.
  bool comprobateIsValid(_email) 
  {
    final _isValid = EmailSender.validateEmail(_email);

    if(!_isValid)
    {
       GlobalToast.displayToast(Text("El correo no existe."), Colors.yellow, Icon(Icons.warning), 3);
    }
    return _isValid;
  }

  ///Function 3: Comprueba si un email esta registrado y le envia un correo con el codigo de verificacion.
  comprobateIsRegistered(_email) async
  {
    final _isRegistered = await checkEmailOnDatabase(lastEmailAux);
    if(_isRegistered.toString() == "NoResponse")
    {
      GlobalToast.displayToast(Text("Error en la base de datos."), Colors.red, Icon(Icons.error), 3);
    }
    else
    {
      if(_isRegistered)
      {
          GlobalToast.displayToast(Text("¡Correo enviado!"), Colors.green, Icon(Icons.check), 3);

          var result = await EmailSender.sendEmail(lastEmailAux,'$codeVerify\nIngresa este código para restablecer tu contraseña');

          if(result == 'success') GlobalToast.displayToast(Text("¡Correo enviado!"), Colors.green, Icon(Icons.check), 3);
          else {GlobalToast.displayToast(Text("No se pudo enviar el email..."), Colors.red, Icon(Icons.error), 3);}
      }
      else
      {
        GlobalToast.displayToast(Text("Este correo no está registrado."), Colors.red, Icon(Icons.error), 3);
      }
    }
  }


  
  ///Function 4: 
  Future checkEmailOnDatabase(_email) async
  {
    final queryParameters = {
      'email': _email,
      'expectedResponse': 'id',
      };
    try
    {
      print("___CheckEmail query___");
      final uri = Uri.https(domain, path+"user_controller.php", queryParameters);
      final response = await http.get(uri);
      print("1 query_result: "+response.body);
      var data = jsonDecode(response.body);

      if(data['result'] == "Error")
      {
        return false;
      } 
      else
      {
        int.parse(data['result'].toString());
        return true;
      }
      
    }catch(e)
    {
      print("2 msgError: "+e.toString());
      return "NoResponse";
    }
  }

///Function 5: Comprueba si el codigo del codeInput_Controller y el codigo enviado en email son el mismo.
bool validateCodeVerify()
{
  bool isValid = false;
  if(codeInput_Controller.text == "")
  {
    GlobalToast.displayToast(Text("Ingrese el código de verificación."), Colors.yellow, Icon(Icons.warning), 3);
  }
  else
  {
    if(codeVerify == codeInput_Controller.text)
    {
      isValid = true;
    }
    else
    {
      GlobalToast.displayToast(Text("Código de verificación inválido."), Colors.red, Icon(Icons.warning), 3);
    }
  }
  return isValid;
}


