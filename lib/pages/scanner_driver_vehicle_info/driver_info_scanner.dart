import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/travel_review/driver_travel_calification_page.dart';
import 'package:taxi_segurito_app/services/auth_service.dart';
import 'package:taxi_segurito_app/services/driver_vehicle_service.dart';
import 'package:taxi_segurito_app/services/report_car_service.dart';
import './widgets/driver_data.dart';
import './widgets/vehicle_data.dart';

class ScannedQrInfoPage extends StatefulWidget {
  String pleik;
  ScannedQrInfoPage(this.pleik);

  @override
  _ScannedQrInfoPageState createState() => _ScannedQrInfoPageState();
}

class _ScannedQrInfoPageState extends State<ScannedQrInfoPage> {
  Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  final _driverVehicleService = DriverVehicleService();
  final _reportCarService = ReportCarService();
  AuthService _authService = AuthService();
  late Future<Map<String, dynamic>?> futureInfo;
  late Driver driver;
  late Vehicle vehicle;
  late int driverHasVehicleId;
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    futureInfo = _driverVehicleService.getDriverAndVehicleByPleik(widget.pleik);
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      backgroundColor: colorMain,
      elevation: 0,
      title: Text(
        'Datos del Conductor',
        textAlign: TextAlign.center,
      ),
      foregroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "scannerQr"),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          );
        },
      ),
    );

    final cancelButton = CustomButton(
      onTap: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, 'scannerQr',
            arguments: await _authService.getCurrentUsername());
      },
      buttonText: 'Escanear nuevo QR',
      buttonColor: Colors.white,
      buttonTextColor: colorMain,
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 0,
      marginTop: 10,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            height: constraints.maxHeight,
            child: FutureBuilder(
              future: futureInfo,
              builder: (_, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    driver = snapshot.data!['driver'] as Driver;
                    vehicle = snapshot.data!['vehicle'] as Vehicle;
                    driverHasVehicleId = snapshot.data!['idDriverHasVehicle'];
                    return Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DriverData(driver),
                          Center(
                            child: FutureBuilder(
                              future: _reportCarService
                                  .getAverageRating(vehicle.idVehicle!),
                              builder: (_, AsyncSnapshot<double> snapshot) {
                                if (snapshot.hasData) {
                                  return getRatingBar(snapshot.data!);
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: VehicleData(vehicle),
                          ),
                          FutureBuilder(
                            future: _authService.isLoggedIn(),
                            builder: (_, AsyncSnapshot<bool> snapshot) {
                              if (snapshot.hasData) {
                                isLoggedIn = snapshot.data!;
                                return Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      children: [
                                        // Expanded(flex: 1, child: cancelButton),
                                        // Expanded(flex: 1, child: btnNewReview)
                                        getNewReviewButton(isLoggedIn),
                                        cancelButton,
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          )
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }

  Widget getRatingBar(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rating.toString(),
          style: TextStyle(fontSize: 20),
        ),
        RatingBarIndicator(
          rating: rating,
          itemSize: 25,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget getNewReviewButton(bool isloggedin) {
    return isloggedin
        ? CustomButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => TravelReviewPage(driver, vehicle)));
            },
            buttonText: 'Nueva Reseña',
            buttonColor: colorMain,
            buttonTextColor: Colors.white,
            marginBotton: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 10,
          )
        : CustomButton(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            buttonText: 'Iniciar sesión para agregar reseña',
            buttonColor: colorMain,
            buttonTextColor: Colors.white,
            marginBotton: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 10,
          );
  }
}
