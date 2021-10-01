import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/button_app.dart';
import 'package:taxi_segurito_app/components/utils/colors.dart' as utils;
import '../../../components/sidemenu/side_menu.dart';

class DriverTravelCalificationPage extends StatefulWidget {
  @override
  _DriverTravelCalificationPageState createState() =>
      _DriverTravelCalificationPageState();
}

class _DriverTravelCalificationPageState
    extends State<DriverTravelCalificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttonCalificate(),
      appBar: AppBar(
        backgroundColor: utils.Colores.bar,
        elevation: 0, //Cambie el color del appBar
        title: Text('Agregar reseña'),
      ),
      drawer: SideMenu(),
      body: ListView(
        children: [
          SizedBox(height: 10),
          _bannerPriceInfo('Auto - Toyota', 'Color - Plomo'),
          SizedBox(height: 10),
          _textCalificateYourDriver(),
          SizedBox(height: 5),
          _ratingBar(),
          SizedBox(height: 10),
          _textInputCalificateYourDriver(),
        ],
      ),
    );
  }
}

void saveTravelCalification() async {}

Widget _buttonCalificate() {
  return Container(
    height: 50,
    margin: EdgeInsets.all(20),
    child: ButtonApp(
      onPressed: () {},
      text: 'CALIFICAR',
      color: Colors.amber,
    ),
  );
}

Widget _textInputCalificateYourDriver() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: TextField(
        maxLines: 5,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Deja un comentario'),
      ));
}

Widget _ratingBar() {
  return Center(
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
          print('RATING:$rating');
        }),
  );
}

Widget _textCalificateYourDriver() {
  return Container(
      height: 17,
      width: double.infinity,
      child: Column(children: [
        Text('CALIFICA A TU CONDUCTOR',
            style: TextStyle(
                color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14))
      ]));
}

Widget _bannerPriceInfo(
  String title,
  String value,
) {
  return Container(
    height: 140,
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
