import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/services/user_service.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';

class EditUserFunctionality {
  SessionsService sessions = SessionsService();
  UserService userService = new UserService();
  
  AuthService _authService = AuthService();
  bool isSession = false;

  TextEditingController nombreCompletoController = TextEditingController();
  TextEditingController cellphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
          nombreCompletoController.text = dataSet['fullname'];
          cellphoneController.text = dataSet['cellphone'];
          emailController.text = dataSet['email'];

        }
        else{
          //GlobalToast.displayToast(Text("¡Ups! No se pudo cargar el perfil"),Colors.yellow, Icon(Icons.error), 1);
        }
      }
    }
    catch(exception)
    {
      //GlobalToast.displayToast(Text("¡Ups! No se pudo cargar el perfil"),Colors.yellow, Icon(Icons.error), 1);
    }
  }

  onPressedBtnSaveChanges(context) async
  {
    try {
      final idClientUser = await _authService.getCurrentId();
      User user = new User.update(idClientUser, nombreCompletoController.text, cellphoneController.text);
      bool result = await userService.updateUser(user);

      if(result) {
        //GlobalToast.displayToast(Text("Se han guardado los cambios"),Colors.green, Icon(Icons.check), 3);
        Navigator.pop(context);
      }
      else {
        //GlobalToast.displayToast(Text("Error, inténtelo de nuevo mas tarde..."),Colors.red, Icon(Icons.error), 3);
      }
    }
    catch(exception)
    {
      print(exception);
    }
  }

}
