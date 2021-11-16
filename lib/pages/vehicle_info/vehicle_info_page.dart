import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/vehicle_reviews.dart';

class VehicleInfoPage extends StatelessWidget {
  Vehicle _vehicle;
  VehicleInfoPage(this._vehicle);
  @override
  Widget build(BuildContext context) {
    Image photo = Image.asset("assets/images/logoPrincipal.png");
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade300,
        child: Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
              ),
              Text("Ver comentarios y reseñas"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehicleReviewsPage(_vehicle)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade300),
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
        foregroundColor: Colors.white,
        title: Text('Datos de mi vehículo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: (52),
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: photo,
              ),
            ),
          ),
          Text("Vehículo"),
          Text(_vehicle.pleik),
          Divider(
            height: 30,
            thickness: 2,
          ),
          Row(
            children: [
              Text(
                "Modelo: ",
                textAlign: TextAlign.left,
              ),
              Text(
                _vehicle.model,
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
          Row(
            children: [
              Text(
                "Color: ",
                textAlign: TextAlign.left,
              ),
              Text(
                _vehicle.color,
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
