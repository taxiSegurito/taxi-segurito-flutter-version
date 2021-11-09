import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/bloc/services/env.dart';
import 'package:taxi_segurito_app/models/clientuser.dart';

Future<bool> insertClient(Clientuser clientuser) async {
  String path = Service.url + "createUser.php";
  var response = await http.post(Uri.parse(path), body: {
    "fullname": clientuser.fullName,
    "cellphone": clientuser.cellphone,
    "email": clientuser.email,
    "password": clientuser.password,
    "register": clientuser.registerType
  });
  var result = json.decode(response.body);

  if (result == "Success") {
    return Future<bool>.value(true);
  } else {
    return Future<bool>.value(false);
  }
}

Future<dynamic> checkEmailOnDatabase(_email) async
{
  final queryParameters = {
    'email': _email,
    'expectedResponse': 'id',
  };
  try{
    print("___CheckEmail query___");
    final uri = Uri.https(Service.domain, Service.path+"user/user_controller.php", queryParameters);
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
    return 'NoResponse';
  }
}