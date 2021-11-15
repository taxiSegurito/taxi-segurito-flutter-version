import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/models/report_car_select.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/personalDataDriver/personalDataDriver.dart';
import 'package:taxi_segurito_app/pages/report_car_viewcomments/details.dart';


class CommentsCar extends StatefulWidget{

  final Vehicle index;
  CommentsCar(this.index);
  void Function(dynamic dynamicObject)? callback;
  
  _ContainerListComments _containerListComments =
      new _ContainerListComments();
  //CommentsCar({Key? key, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _containerListComments;
  }

  set setCallbak(function) {
    this.callback = function;
  }
}

class _ContainerListComments extends State<CommentsCar>{
  
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Comentarios',
          ), 
        ),
      body: Padding(padding: EdgeInsets.all(20.0), child: _buildListViewComents(context),) ,
      
    );
  }
  
  
  List<ReportCarSelect> data =[];
  //This method for get comments of vehicles
  Future<List<ReportCarSelect>> getComments() async {
    int? idVehicle = widget.index.idVehicle;
    int? idOwner = widget.index.idOwner;
    String path = 'http://10.0.2.2:2325/backend/ReportCar_controller.php?idUserSession='+idOwner.toString()+'&idVehicleOfOwner='+idVehicle.toString();
    final response = await http.get(Uri.parse(path));
    if(response.statusCode == 200){
      return Future<List<ReportCarSelect>>.value(
        convertToList(response)
      );
    } else {
      return Future<List<ReportCarSelect>>.value(null); 
        
    }
  }
  //method convert to list for vehicles
  List<ReportCarSelect> convertToList(response){
    List<ReportCarSelect> listLost = [];
    for(var vehicle in jsonDecode(response.body)) {
      listLost.add(ReportCarSelect.fromJson(vehicle));
      
    }
    return listLost;
  }

  @override
  void initState() {
    super.initState();
    getComments().then((value) => 
        setState((){
          data.clear();
          data.addAll(value);
        })
      );
  }

//list of comments
  ListView _buildListViewComents(BuildContext context) {
    

    
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_,i) {
        
        return Center(
          
          child: Column(
            
            children: [
              
              ListTile(
                
                title: Text(data[i].fullnameUser!),
                subtitle: Text(data[i].datetime!),
                leading: CircleAvatar(radius: 25,
                backgroundColor: Colors.white,
                  child: ClipRRect(
                    
                    borderRadius:BorderRadius.circular(15),
                    child: Image(
                      image: Image.memory(widget.index.picture).image,
                    )
                  )
                ),
                
         
              ),
              
              Align(
                alignment: Alignment.centerLeft,
                child: RatingBarIndicator(
                  
                  rating: data[i].calification!,
                  direction: Axis.horizontal,
                  itemSize: 20,
                  itemCount: 5,
                  itemBuilder: (context,_) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ),
              Text(data[i].comments!),
              Divider(height: 30, thickness: 2,),
              
            ],
            
          )
        );
      },
    );
  }
}
