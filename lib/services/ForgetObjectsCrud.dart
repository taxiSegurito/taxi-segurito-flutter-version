import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/ForgetObjects.dart';


Future<List<ForgetObjectsList>> getLostObjects() async {
  String path = "http://10.0.2.2:8282/LostObjects/forgetobject_controller.php";
  var response = await http.get(Uri.parse(path));

  if (response.statusCode == 200) {
    return Future<List<ForgetObjectsList>>.value(convertToList(response));
  } else {
    return Future<List<ForgetObjectsList>>.value(null);
  }
}

List<ForgetObjectsList> convertToList(response) {
  List<ForgetObjectsList> listLost = [];
  for (var object in json.decode(response.body)) {
    listLost.add(ForgetObjectsList.fromJson(object));
  }
  return listLost;
}
    Future<bool> deleteLostObjects(ForgetObjectsList forgetObjects) async {
    String path = "http://10.0.2.2:8282/LostObjects/forgetobject_controller.php";
    final response = await http.delete(Uri.parse(path),body: jsonEncode({"idForgetObject":int.parse(forgetObjects.idForgetObject.toString())}));
    var res = response.body;
      print("Borrado : " + res);
      return Future<bool>.value(true);
    }

    /*Future deleteLostObjects() async {
    String path = "http://10.0.2.2:8282/LostObjects/forgetobject_controller.php";
    final response = await http.delete(Uri.parse(path),body: jsonEncode({"idForgetObject":int.parse(widget.dynamicObject.idForgetObject)}));
    var res = response.body;
    if(res == "true") {
      print("Borrado Exitosamente" + res);
    }
    else{
      print("Error : " + res);
      }
    }*/