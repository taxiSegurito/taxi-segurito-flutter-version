import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/button_app.dart';

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
      body: Column(
        children: [
          _bannerPriceInfo(),
          _listTitleTravelInfo(
              'Desde', 'Cr falssa con calle falsa', Icons.location_on),
          _listTitleTravelInfo(
              'Hasta', 'Cr falssa con calle falsa', Icons.directions_run),
          SizedBox(height: 20),
          _textCalificateYourDriver(),
          SizedBox(height: 10),
          _ratingBar()
        ],
      ),
    );
  }
}

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
  return Text(
    'CALIFICA A TU CONDUCTOR',
    style: TextStyle(
        color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 18),
  );
}

Widget _listTitleTravelInfo(String title, String value, IconData icon) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 30),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        maxLines: 1,
      ),
      subtitle: Text(
        value,
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        maxLines: 2,
      ),
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
    ),
  );
}

Widget _bannerPriceInfo() {
  return ClipPath(
    clipper: OvalBottomBorderClipper(),
    child: Container(
      height: 250,
      width: double.infinity,
      color: Colors.amber,
      child: Column(
        children: [
          SizedBox(height: 20),
          Icon(Icons.check_circle, color: Colors.grey[800], size: 100),
          SizedBox(height: 20),
          Text(
            'TU VIAJE A FINALIZADO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Costo del viaje',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '0\Bs',
            style: TextStyle(
                fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
