import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Owner.dart';

Future<List<Owner>> select() async {
  try {
    String path = Service.url + "Owner/owner_controller.php";

    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<Owner>>.value(
        convertToList(response),
      );
    } else {
      return Future<List<Owner>>.value(
        [],
      );
    }
  } catch (exception) {
    return Future<List<Owner>>.value(
      [],
    );
  }
}

List<Owner> convertToList(response) {
  List<Owner> listowner = [];
  for (var singleOwner in json.decode(response.body)) {
    listowner.add(
      Owner.fromJson(singleOwner),
    );
  }
  return listowner;
}

Future<List<Owner>> selectByLike(value) async {
  try {
    String path =
        Service.urlLocal + "Owner/owner_controller.php?criteria=" + value;
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<Owner>>.value(
        convertToList(response),
      );
    } else {
      return Future<List<Owner>>.value(
        [],
      );
    }
  } catch (exception) {
    return Future<List<Owner>>.value(
      [],
    );
  }
}
