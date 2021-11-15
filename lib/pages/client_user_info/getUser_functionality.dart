import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/client_user_edit/editUser_page.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/user_service.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';

class GetUserFunctionality {
  SessionsService sessions = SessionsService();
  UserService userService = new UserService();
  
  AuthService _authService = AuthService();
  bool isSession = false;
  var dataUser;

  TextEditingController nombreCompletoController = TextEditingController();
  TextEditingController cellphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String nationality = "+591";


  loadData() async
  {
    try {
      isSession = await sessions.verificationSession("id");
      if(isSession)
      {
        final idClientUser = await _authService.getCurrentId();
        var dataSet = await userService.getUserById(idClientUser);
        if(dataSet.toString() != "error")
        {

          dataUser = dataSet;
          nombreCompletoController.text = dataUser['fullname'];
          cellphoneController.text = dataUser['cellphone'];
          emailController.text = dataUser['email'];
          nationality = "+591";
          return;
        }
        else{
          //GlobalToast.displayToast(Text("¡Ups! No se pudo cargar el perfil"),Colors.yellow, Icon(Icons.error), 1);
        }
        setDefaultControllers();
      }
    }
    catch(exception)
    {
      setDefaultControllers();
      //GlobalToast.displayToast(Text("¡Ups! No se pudo cargar el perfil"),Colors.yellow, Icon(Icons.error), 1);
    }
  }

  void onPressedBtnEditUser(context) async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser_page()),);
  }

  //Set all controllers to default values.
  void setDefaultControllers()
  {
    nombreCompletoController.text = 'Invitado';
    cellphoneController.text = '-';
    emailController.text = '-';
    nationality = '';
  }
}

