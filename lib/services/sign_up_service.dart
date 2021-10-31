import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'server.dart';

class SignUpService {
  Future<bool> _registerClient(Clientuser clientUser, String signUpType) async {
    String path = Server.url + "/auth/auth_controller.php";
    final response = await http.post(Uri.parse(path), body: {
      "fullname": clientUser.fullName,
      "cellphone": clientUser.cellphone,
      "email": clientUser.email,
      "password": clientUser.password,
      "typeRegister": signUpType
    });

    final success = response.statusCode == 200;
    return success;
  }

  Future<bool> registerClientThroughEmail(Clientuser clientUser) async {
    final success = await _registerClient(
      clientUser,
      Server.SignUpType['EMAIL']!,
    );
    return success;
  }

  Future<bool> registerClientThroughGoogle(Clientuser clientUser) async {
    final success = await _registerClient(
      clientUser,
      Server.SignUpType['GOOGLE']!,
    );
    return success;
  }

  Future<bool> registerClientThroughFacebook(Clientuser clientUser) async {
    final success = await _registerClient(
      clientUser,
      Server.SignUpType['FACEBOOK']!,
    );
    return success;
  }
}
