import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/Button_app.dart';

import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/ReportCar.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/services/ReportCarService.dart';
import '../../../components/sidemenu/side_menu.dart';

class DriverTravelCalificationPage extends StatefulWidget {
  Driver? driver = new Driver();
  ReportCar? reportCar = new ReportCar();
  Vehicle? vehicle = new Vehicle();
  DriverTravelCalificationPage(this.driver, this.vehicle);
  @override
  _DriverTravelCalificationPageState createState() =>
      _DriverTravelCalificationPageState();
}

class _DriverTravelCalificationPageState
    extends State<DriverTravelCalificationPage> {
  TextEditingController txtComent = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.reportCar!.idClientuser = "55";
    widget.reportCar!.idVehicule = widget.vehicle!.idVehicle!;
  }

  @override
  Widget build(BuildContext context) {
    insertDataBase() async {
      widget.reportCar!.calification = txtComent.text;
      insertReportCar(widget.reportCar!).then(
        (value) {
          if (value) {
            Navigator.pushNamed(context, 'adminMenu');
          } else {
            print("no se inserto");
          }
        },
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
                  )))
        ],
      );
    }

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
              widget.driver!.name,
              'Auto -' + widget.vehicle!.model,
              'Color - ' + widget.vehicle!.color),
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
                widget.reportCar!.calification = rating.toString();
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
}

Widget _textCalificateYourDriver() {
  return Container(
    height: 17,
    width: double.infinity,
    child: Column(
      children: [
        Text('CALIFICA A TU CONDUCTOR',
            style: TextStyle(
                color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14))
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
          'TU VIAJE A FINALIZADO',
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
