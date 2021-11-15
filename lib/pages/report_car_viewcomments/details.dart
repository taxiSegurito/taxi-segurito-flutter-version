//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/report_car_viewcomments/comentsCar.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  DetailsPage(this.index);
  @override
  Widget build(BuildContext context) {
    Image photo = Image.asset("lib/assets/logoPrincipal.png");
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment: Alignment.centerLeft,),
              Text("Ver comentarios y reseñas"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => CommentsCar()
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Datos del Vehículo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(radius: (52),
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child: photo,
              ),
            ),
          ),
          Text("Vehículo"),
          Text("1945PHR"),
          Divider(height: 30, thickness: 2,),
          Row(
            children: [
              Text("Modelo: ", textAlign: TextAlign.left,),
              Text("43823843CB", textAlign: TextAlign.right,),
            ],
          ),
          Divider(height: 30, thickness: 2, ),
          Row(
            children: [
              Text("Color: ", textAlign: TextAlign.left,),
              Text("Negro", textAlign: TextAlign.right,),
            ],
          ),
          Divider(height: 30, thickness: 2,),
          
        ],
      ),
    );
  }
}