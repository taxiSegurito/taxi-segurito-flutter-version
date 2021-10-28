import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/services/env.dart';
import 'package:taxi_segurito_app/models/Company.dart';

Future<bool> insert(Company company) async {
  try {
    var path = Service.url + "insertCompany.php";
    final response = await http.post(
      Uri.parse(path),
      body: {
        'name': company.companyName,
        'nit': company.nit,
      },
    );
    String result = json.decode(response.body);

    if (result == "Success") {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  } catch (exception) {
    return Future<bool>.value(false);
  }
}

Future<bool> update(Company company) async {
  try {
    var path = Service.urlLocal + "company_controller.php";
    final response = await http.post(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "name": company.companyName,
          "nit": company.nit,
          "id": company.idCompany,
          "typeRequest": "UPDATE"
        },
      ),
    );
    String result = json.decode(response.body);
    if (result == "Success") {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  } catch (exception) {
    return Future<bool>.value(false);
  }
}

Future<List<Company>> selectCompany() async {
  try {
    String path = Service.url + "Company/company_controller.php";
    var response = await http.get(Uri.parse(path));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Future<List<Company>>.value(
        convertToList(response),
      );
    } else {
      return Future<List<Company>>.value(
        [],
      );
    }
  } catch (exception) {
    return Future<List<Company>>.value(
      [],
    );
  }
}

List<Company> convertToList(response) {
  List<Company> listCompany = [];
  for (var singleOwner in json.decode(response.body)) {
    listCompany.add(
      Company.fromJson(singleOwner),
    );
  }
  return listCompany;
}

Future<List<Company>> selectCompanyByLike(value) async {
  try {
    String path = Service.url + "company_controller.php?criteria=" + value;
    var response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return Future<List<Company>>.value(
        convertToList(response),
      );
    } else {
      return Future<List<Company>>.value(
        [],
      );
    }
  } catch (exception) {
    return Future<List<Company>>.value(
      [],
    );
  }
}
