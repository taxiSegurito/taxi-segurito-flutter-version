import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/models/report_car.dart';
import 'package:taxi_segurito_app/models/user.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/services/report_car_service.dart';

class VehicleReviewsPage extends StatefulWidget {
  final Vehicle _vehicle;
  VehicleReviewsPage(this._vehicle, {Key? key}) : super(key: key);

  @override
  _VehicleReviewsPageState createState() => _VehicleReviewsPageState();
}

class _VehicleReviewsPageState extends State<VehicleReviewsPage> {
  ReportCarService _reportCarService = ReportCarService();
  late Future<List<Map<String, dynamic>>?> _reviewsFuture;

  @override
  void initState() {
    super.initState();
    _reviewsFuture =
        _reportCarService.getVehicleReviews(widget._vehicle.idVehicle!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Comentarios de mi vehículo',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: _reviewsFuture,
          builder: (_, AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
            if (snapshot.hasData) {
              final reviews = snapshot.data!;
              return ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (_, index) {
                  final reviewUser = reviews[index];
                  final review = reviewUser['comment'] as ReportCar;
                  final user = reviewUser['user'] as User;
                  return Center(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(user.fullName),
                          subtitle: Text(review.datetime!),
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.memory(widget._vehicle.picture),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RatingBarIndicator(
                            rating: review.calification!,
                            direction: Axis.horizontal,
                            itemSize: 20,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Text(review.comment!),
                        Divider(
                          height: 25,
                          thickness: 1.5,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
