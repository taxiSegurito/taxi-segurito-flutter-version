import 'dart:convert';
import 'dart:developer';
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/utils/admin_session_for_.social_networks.dart';

class Services {
  //host Local
  //String host = "192.168.56.1";
  //host Server
  /*String path =
      "/Backend-taxi-git/taxi-segurito-backend/app/api/user/user_controller.php";*/
  String host = "taxi-segurito.herokuapp.com";
  String path = "/api/user/user_controller.php";
  //Method that sends data to backend
  Future<bool> AddData(Clientuser client) async {
    try {
      bool control = false;
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      var url = "http://" + host + path;
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": client.email,
            "password": client.password, //por defecto
            "fullName": client.fullName,
            "cellphone": client.cellphone,
            "typeRegister": client.registerType,
            "idrole": 15, //server 15 es para cliente
            "type": "Insert"
          }));
      var res = jsonDecode(response.body);
      if (res['result'] == "success") {
        //The procedure was carried out successfully
        log("Entro?");
        control = true;
        AdminSession().AddSession(client);
      } else {
        //failure
        log(res['result']);
        control = false;
      }
      return control;
    } catch (e) {
      //if there is any uncontrolled error
      log(e.toString() + " Aqui ?");
      return false;
    }
  }

  Future<String> GetId(String email) async {
    try {
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      String type = "id";
      final parameters = {'email': email, 'expectedResponse': type};
      final rute = Uri.http(
          host,
          path,
          //'/Backend-taxi-git/taxi-segurito-backend/app/api/user/user_controller.php',
          parameters);
      var response = await http.get(rute);
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'].toString();
    } catch (e) {
      log(e.toString());
      return "Error";
    }
  }

  //Verifica que exista en la base de datos
  //return cellphone si existe
  //return Error si no
  Future<String> GetCellphoneIfExists(String email) async {
    try {
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      String type = "cellphone";
      final parameters = {'email': email, 'expectedResponse': type};
      final rute = Uri.http(
          host,
          path,
          //'/Backend-taxi-git/taxi-segurito-backend/app/api/user/user_controller.php',
          parameters);
      var response = await http.get(rute);
      var res = jsonDecode(response.body);
      log(res['result'].toString());
      return res['result'].toString();
    } catch (e) {
      log(e.toString());
      return "Error";
    }
  }

  Future<List<String>?> GetListFromDB() async {
    List<String> numbers = List.empty();
    int id = await AdminSession().GetIdSession();
    try {
      //var url = Service.url + "UserAdd/UserController.php";
      /*var url =
          "http://192.168.0.3/backend-taxi-segurito-app/UserController.php";*/
      String type = "listNumberCellphone";
      final parameters = {'id': id, 'expectedResponse': type};
      final rute = Uri.http(
          host,
          '/Backend-taxi-git/taxi-segurito-backend/app/api/user/user_controller.php',
          parameters);
      var response = await http.get(rute);
      var res = jsonDecode(response.body);
      numbers = res;
      log(res['result'].toString());
      return numbers;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
