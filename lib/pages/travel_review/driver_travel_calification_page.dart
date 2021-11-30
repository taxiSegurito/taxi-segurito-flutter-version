import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/Button_app.dart';

import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/report_car.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/report_car_service.dart';
import '../../../components/sidemenu/side_menu.dart';

class TravelReviewPage extends StatefulWidget {
  ReportCar reportCar = new ReportCar();
  Driver driver;
  Vehicle vehicle;
  TravelReviewPage(this.driver, this.vehicle) {
    reportCar.idVehicule = vehicle.idVehicle;
  }
  @override
  _TravelReviewPageState createState() => _TravelReviewPageState();
}

class _TravelReviewPageState extends State<TravelReviewPage> {
  ReportCarService _reportCarService = ReportCarService();
  AuthService _authService = AuthService();
  TextEditingController txtComent = new TextEditingController();

  void _getUserId() async {
    widget.reportCar.idClientuser = await _authService.getCurrentId();
  }

  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mensaje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  insertDataBase() async {
    _getUserId();
    widget.reportCar.comment = txtComent.text;
    _reportCarService.insertReportCar(widget.reportCar).then(
      (value) async {
        if (value) {
          await _showDialog("Muchas gracias por agregar tu reseña!");
        } else {
          await _showDialog(
              "Ups! no se registró tu reseña, inténtalo otra vez.");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0, //Cambie el color del appBar
        title: Text('Agregar reseña'),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            _bannerPriceInfo(
                widget.driver.fullName,
                'Modelo: ' + widget.vehicle.model,
                'Color: ' + widget.vehicle.color),
            SizedBox(height: 10),
            Text(
              'Califica a tu conductor',
              style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(height: 5),
            RatingBar.builder(
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              unratedColor: Colors.grey[300],
              onRatingUpdate: (rating) {
                print(rating);
                widget.reportCar.calification = rating;
              },
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: TextField(
                controller: txtComent,
                maxLines: 5,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Deja un comentario'),
              ),
            ),
            _buttonCalificate(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonCalificate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ButtonApp(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Cancelar',
          textColor: Colors.amber,
          color: Colors.white,
        ),
        ButtonApp(
          onPressed: () {
            insertDataBase();
          },
          text: 'Enviar',
          color: Colors.amber,
        ),
      ],
    );
  }

  Widget _bannerPriceInfo(
    String title,
    String value,
    String driver,
  ) {
    double width = MediaQuery.of(context).size.width / 3.5;
    return Column(
      children: [
        Icon(Icons.check_circle, color: Colors.grey[800], size: 48),
        SizedBox(height: 5),
        Text(
          'Tu viaje a finalizado',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 20),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.memory(widget.driver.picture).image,
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          driver,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
