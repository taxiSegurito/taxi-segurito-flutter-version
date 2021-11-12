import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';

class EmergencyContactService{

/// Obtiene contactos de emergencia segun el id del usuario.
Future getEmergencyContactsByIdUser(EmergencyContact emergencyContact) async {
  try{
    print("___getEmergencyContactsByIdUser query___");
    final queryParameters = {
      'idClientUser': emergencyContact.idClientUser.toString(),
    };
    final uri = Uri.https(Server.host, Server.baseEndpoint+"/emergencyContact/emergencyContact_controller.php", queryParameters);
    final response = await http.get(uri);
    print("  1 query_result: "+response.body);
    return jsonDecode(response.body);
  }
  catch(e)
  {
    print("  2 msgError: "+e.toString());
    return "Error";
  } 
}

/// Registra un contacto de emergencia en la base de datos.
Future insertEmergencyContact(EmergencyContact emergencyContact) async {
  try{
    print("___InsertEmergencyContact query___");
    final uri = Server.url+"/emergencyContact/emergencyContact_controller.php";
    print(emergencyContact.idClientUser);
    final response = await http.post(Uri.parse(uri),body:{
      "nameContact" : emergencyContact.nameContact,
      "number" : emergencyContact.number,
      "idClientUser" : emergencyContact.idClientUser.toString(),
    });
    print("  1 query_result: "+response.body);
    var data = jsonDecode(response.body);
    if(data == "success")
    {
      return true;
    } 
    else
    {
      return false;
    } 
  }
  catch(e) {
    print("  2 msgError: "+e.toString());
    return false;
  }
}


/// Edita un contacto segun su id en la base de datos.
Future updateEmergencyContact(EmergencyContact emergencyContact) async {
  try{
    print("___UpdateUserData query___");
    final uri = Server.url+"/emergencyContact/emergencyContact_controller.php";
    final response = await http.put(Uri.parse(uri),body:jsonEncode({
      "idEmergencyContact" : emergencyContact.idEmergencyContact,
      "nameContact" : emergencyContact.nameContact,
      "number" : emergencyContact.number,
    }));
    print("  1 query_result: "+response.body);
        var data = jsonDecode(response.body);
    if(data == "success")
    {
      return true;
    } 
    else
    {
      return false;
    } 
  }
  catch(e) {
    print("  2 msgError: "+e.toString());
    return false;
  }
}
  
/// Delete a emergency contact .
Future deleteEmergencyContact(EmergencyContact emergencyContact) async {
  try{
    print("___deleteEmergencyContact query___");
    final url = Server.url+"/emergencyContact/emergencyContact_controller.php";
    final response = await http.delete(Uri.parse(url),body:jsonEncode({
      "idEmergencyContact" : emergencyContact.idEmergencyContact,
    }));
    print("  1 query_result: "+response.body);
    var data = jsonDecode(response.body);
    if(data == "success")
    {
      return true;
    } 
    else
    {
      return false;
    } 
  }
  catch(e)
  {
    print("  2 msgError: "+e.toString());
    return false;
  }
}
}