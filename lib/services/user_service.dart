import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/user.dart';

class UserService {
  Future<dynamic> getIdByEmail(String email) async {
    try{
    final queryParams = {'email': email,'expectedResponse': 'id',};
    print("___CheckEmail query___");
      final endpoint = Uri.http(
        Server.host,
        "${Server.baseEndpoint}/User/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      print("1 query_result: "+response.body);
      var result = jsonDecode(response.body);
      if (result['result'] != 'Error') {//if (response.statusCode == 200) {
        return result['result'];
      }
      return 'Error';
    } catch (exception) {
      return 'Error';
    }
}
Future<bool> updatePasswordByEmail(String email, String password) async {
  var url ="https://taxi-segurito.000webhostapp.com/flutter_api/updatePassword.php";
  var response = await http.post(Uri.parse(url),body:{
    "email" : email,
    "newPassword" : password,
  });
  print("2: "+response.body);
  //print("3 MD5: "+ md5.convert(utf8.encode("123")).toString());
  var data = json.decode(response.body);
  if(data == "Error"){
    return false;
    /*
    Fluttertoast.showToast(
      msg: "Error en la base de datos.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white
    );
    */
  }
  else
  {
    return true;
    /*
    Fluttertoast.showToast(
      msg: "¡Contraseña cambiada con éxito!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,
      textColor: Colors.white
    );
    */
  }
    try{
      //Navigator.pushNamed(context, 'loginUser');
    }catch(e){}
  }

/*
  Future<List<User>> selectUserByCriteria(criteria) async {
    try {
      final queryParams = {'criteria': criteria};
      final endpoint = Uri.http(
        Server.host,
        "${Server.baseEndpoint}/User/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      if (response.statusCode == 200) {
        return convertToList(response);
      }
      return [];
    } catch (exception) {
      return [];
    }
  }
  */
  /*
  Future<bool> insert(User user) async {
    try {
      var path = "${Server.url}/User/user_controller.php";
      final response = await http.post(
        Uri.parse(path),
        body: jsonEncode({
          'name': user.userName,
          'nit': user.nit,
        }),
      );
      return response.statusCode == 200;
    } catch (exception) {
      return false;
    }
  }
*/
/*
  Future<bool> update(User user) async {
    try {
      var path = "${Server.url}/User/user_controller.php";
      final response = await http.put(
        Uri.parse(path),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'name': user.userName,
            'nit': user.nit,
            'id': user.idUser,
            'status': 1,
          },
        ),
      );

      if (response.statusCode == 200) {
        String result = json.decode(response.body);
        return result == "success";
      }
      return false;
    } catch (exception) {
      return false;
    }
  }
*//*
  Future<List<User>> selectUser() async {
    try {
      String path = "${Server.url}/User/user_controller.php";
      var response = await http.get(Uri.parse(path));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return convertToList(response);
      }
      return [];
    } catch (exception) {
      return [];
    }
  }
  */
/*
  List<User> convertToList(response) {
    List<User> listUser = [];
    for (var singleOwner in json.decode(response.body)) {
      listUser.add(
        User.fromJson(singleOwner),
      );
    }
    return listUser;
  }
*/
/*
  Future<List<User>> selectUserByCriteria(criteria) async {
    try {
      final queryParams = {'criteria': criteria};
      final endpoint = Uri.http(
        Server.host,
        "${Server.baseEndpoint}/User/user_controller.php",
        queryParams,
      );

      var response = await http.get(endpoint);
      if (response.statusCode == 200) {
        return convertToList(response);
      }
      return [];
    } catch (exception) {
      return [];
    }
  }
  */
}