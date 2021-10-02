import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class UpdatePassword extends StatefulWidget {
  String _auxEmail;//Aux para recibir email
  UpdatePassword(this._auxEmail); //Aux para pasar email

  @override
  _UpdatePasswordState createState() => new _UpdatePasswordState(_auxEmail);
}

class _UpdatePasswordState extends State<UpdatePassword> {
//Variables
  String _email;//Aux para recibir email
  _UpdatePasswordState(this._email);//Aux para recibir email
  var newPassword_Controller = '';
  var repeatNewPassword_Controller = '';

  void updatePassword() async
  {
    /* Falta
     3. Que te redireccione al login cuando se cambia la contra
     4. Cambiar paths por BDD en la nube
     5. Quitar que pase de ventna cuando el campo codeVerify esta vaci
     extra: Verificar que el codificador que usamos sea EL MISMO
    */
    var url ="https://taxi-segurito.000webhostapp.com/flutter_api/updatePassword.php";
    var response = await http.post(Uri.parse(url),body:{
      "email" : _email,
      "newPassword" : newPassword_Controller,
    });
    print("2: "+response.body);

    print("3 MD5: "+ md5.convert(utf8.encode("123")).toString());

    var data = json.decode(response.body);

    if(data == "Error"){
      Fluttertoast.showToast(
        msg: "Error en la base de datos.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white
      );
    }
    else
    {
      Fluttertoast.showToast(
        msg: "¡Contraseña cambiada con éxito!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white
      );
    }


  }

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
                        onChanged: (text) {newPassword_Controller = text;},
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
                        onChanged: (text) {repeatNewPassword_Controller = text;},
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
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow.shade600),
                                ),
                                onPressed: () {
                                  if(newPassword_Controller == "")
                                  {
                                    ShowCustomToast("Debe ingresar una nueva contraseña");
                                  }
                                  else
                                  {
                                    if(newPassword_Controller == repeatNewPassword_Controller)
                                    {
                                      updatePassword();
                                    }
                                    else
                                    {
                                      ShowCustomToast("Las contraseñas deben coincidir");
                                    }
                                  }
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
void ShowCustomToast(messageVar)
{
  Fluttertoast.showToast(
  msg: messageVar,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  backgroundColor: Colors.yellow,
 textColor: Colors.white
  );
}

