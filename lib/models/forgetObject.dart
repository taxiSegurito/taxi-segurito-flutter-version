import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ForgetObject{ 
  BuildContext context;
  String? nameObject;
  String? description;
  int? idVehicle;
  int? idclientuser;
  ForgetObject({
    required this.context,

    this.nameObject,

    this.description,

    this.idVehicle,

    this.idclientuser

  });
}