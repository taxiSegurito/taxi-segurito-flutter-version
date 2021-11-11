import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/services/user_service.dart';


class UpdatePasswordFuncionality {

  TextEditingController newPassword_Controller = new TextEditingController();
  TextEditingController repeatNewPassword_Controller = new TextEditingController();
  
  void onPressedBtnCambiarContrasena(email) async
  {
    if(newPassword_Controller.text == "" || newPassword_Controller.text == "")
    {
      GlobalToast.displayToast(Text("Debe ingresar y repetir una nueva contraseña"), Colors.yellow, Icon(Icons.warning), 3);
    }
    else
    {
      if(newPassword_Controller.text == repeatNewPassword_Controller.text)
      {
        UserService userService = new UserService();
        userService.updatePasswordByEmail(email,newPassword_Controller.text);
      }
      else
      {
        GlobalToast.displayToast(Text("Las contraseñas deben coincidir"), Colors.yellow, Icon(Icons.warning), 3);
      }
    }
  }

}