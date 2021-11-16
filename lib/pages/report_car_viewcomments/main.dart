
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/report_car_viewcomments/details.dart';
import 'package:taxi_segurito_app/services/vehicle_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      theme: ThemeData(primaryColor: Colors.yellow[600]),
      home: MyHomePage(),
    ) ;
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista Autos',
          ), 
        ),
      body: Padding(padding: EdgeInsets.all(40.0), child: _buildListView(context),) ,
    );
  }
 
  
//list of my vehicles
  ListView _buildListView(BuildContext context) {
    Image photo = Image.asset("lib/assets/logoPrincipal.png");
    
    return ListView.builder(
      
      itemCount: 5,
      itemBuilder: (_,index) {
        return Card(
          child: ListTile(
            
          title: Text('Toyota caldina 1995 $index'),
          subtitle: Text('1945PHR'),
          leading: CircleAvatar(radius: 45,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius:BorderRadius.circular(15),
              child: photo,
            )
          ),

          //leading:  Icon(Icons.car_rental),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(index)));
            },
          )
        );
      },
    );
  }
}