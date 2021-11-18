
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class ReportCarSelect{
  int? idReport;
  double? calification;
  String? comments;
  String? datetime;
  String? fullnameUser;
  

  ReportCarSelect({
    this.idReport,
    this.calification,
    this.comments,
    this.datetime,
    this.fullnameUser,
    
  });

  ReportCarSelect.fromJson(Map<String,dynamic> json){
    idReport = json['idReport'];
    calification = double.parse(json['calification'] as String) ;
    comments = json['comments'];
    datetime = json['datetime'];
    fullnameUser = json['fullnameUser'];
  }
  
}