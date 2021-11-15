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

  insertDataBase() async {
    _getUserId();
    widget.reportCar.comment = txtComent.text;
    _reportCarService.insertReportCar(widget.reportCar).then(
      (value) {
        if (value) {
          Navigator.pushNamed(context, 'adminMenu');
        } else {
          print("no se inserto");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 212, 61, 1),
        elevation: 0, //Cambie el color del appBar
        title: Text('Agregar reseña'),
      ),
      drawer: SideMenu(),
      body: ListView(
        children: [
          SizedBox(height: 10),
          _bannerPriceInfo(
              widget.driver.fullName,
              'Auto -' + widget.vehicle.model,
              'Color - ' + widget.vehicle.color),
          SizedBox(height: 10),
          _textCalificateYourDriver(),
          SizedBox(height: 5),
          Center(
            child: RatingBar.builder(
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
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: TextField(
              controller: txtComent,
              maxLines: 5,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Deja un comentario'),
            ),
          ),
          _buttonCalificate(),
        ],
      ),
    );
  }

  Widget _buttonCalificate() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(20),
              child: ButtonApp(
                onPressed: () {},
                text: 'Cancelar',
                textColor: Colors.amber,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(20),
              child: ButtonApp(
                onPressed: () {
                  insertDataBase();
                },
                text: 'Enviar',
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textCalificateYourDriver() {
    return Container(
      height: 17,
      width: double.infinity,
      child: Column(
        children: [
          Text('Califica a tu conductor',
              style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 14))
        ],
      ),
    );
  }

  Widget _bannerPriceInfo(
    String title,
    String value,
    String driver,
  ) {
    return Container(
      height: 170,
      width: double.infinity,
      child: Column(
        children: [
          Icon(Icons.check_circle, color: Colors.grey[800], size: 50),
          SizedBox(height: 5),
          Text(
            'Tu viaje a finalizado',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            driver,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
