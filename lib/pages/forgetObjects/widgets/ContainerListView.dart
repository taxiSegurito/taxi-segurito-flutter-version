import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:taxi_segurito_app/models//data_vehicle.dart';



class ContainerListView extends StatefulWidget {
  
  void Function(dynamic dynamicObject)? callback;
  _ContainerListViewState _containerListViewState =
      new _ContainerListViewState();
  ContainerListView({Key? key, this.callback}) : super(key: key);

  @override
  _ContainerListViewState createState() {
    return _containerListViewState;
  }

  set setCallbak(function) {
    this.callback = function;
  }

}


class _ContainerListViewState extends State<ContainerListView> {
  

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      child: Padding(padding: EdgeInsets.fromLTRB(40, 5, 40, 20), child: _buildListView(context),)
    );
    
  }
  
  List<Data_Vehicle> data =[];
  //metoth getDataVehicle for return Vehicles 
  Future<List<Data_Vehicle>> getDataVehicle() async {
    String path = "http://10.0.2.2:2325/Models/Vehicle_controller.php";
    final response = await http.get(Uri.parse(path));
    if(response.statusCode == 200){
        
        return Future<List<Data_Vehicle>>.value(
          convertToList(response)
        );
    } else {
        
        return Future<List<Data_Vehicle>>.value(null);
    }  
  }
  //method for convert to List
  List<Data_Vehicle> convertToList(response){
    List<Data_Vehicle> listLost = [];
    for(var vehicle in jsonDecode(response.body)) {
      listLost.add(Data_Vehicle.fromJson(vehicle));
      
    }
    return listLost;
  }


  @override
  void initState(){
    super.initState();
      getDataVehicle().then((value) => 
        setState((){
          data.clear();
          data.addAll(value);
        })
      );
    }
  
  //List of vehicles for forget objects
  ListView _buildListView(BuildContext context){
    
    Image photo = Image.asset("lib/logoPrincipal.png");
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: ListTile(
                title: Text(data[index].model! + " " + data[index].color!, style: TextStyle(fontSize: 20),),
                subtitle: Text(data[index].pleik!),
                leading: CircleAvatar(
                  radius: 45,
                  //backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: photo,
                  ),
                ),
              ),
              onTap: () {
                int idVehicle = data[index].idVehicle!;
                widget.callback!(idVehicle);
              },
            ),
          );
        },
      );
  } 
}
