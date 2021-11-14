import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/services/user_service.dart';


class UpdatePasswordFuncionality {

  late BuildContext context;
  UpdatePasswordFuncionality(this.context);

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
        var result = await userService.updatePasswordByEmail(email,newPassword_Controller.text);
        if(result == true)
        {
          //Navigator.pushNamed(context, 'loginUser');
          GlobalToast.displayToast(Text("¡Contraseña cambiada con exito!"), Colors.green, Icon(Icons.check), 3);
        }
        else
        {
          GlobalToast.displayToast(Text("No se pudo cambiar la contraseña..."), Colors.red, Icon(Icons.error), 3);
        }
        
      }
      else
      {
        GlobalToast.displayToast(Text("Las contraseñas deben coincidir"), Colors.yellow, Icon(Icons.warning), 3);
      }
    }
  }

}