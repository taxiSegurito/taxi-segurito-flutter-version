import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';
import 'package:taxi_segurito_app/models/Driver.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/pages/scanDataDriver/widgets/driver_data.dart';
import 'package:taxi_segurito_app/pages/scanDataDriver/widgets/vehicle_data.dart';
import 'package:taxi_segurito_app/services/driver_vehicle_service.dart';

class ScannedQrInfoPage extends StatefulWidget {
  String pleik;
  ScannedQrInfoPage(this.pleik);

  @override
  _ScannedQrInfoPageState createState() => _ScannedQrInfoPageState();
}

class _ScannedQrInfoPageState extends State<ScannedQrInfoPage> {
  Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  final _driverVehicleService = DriverVehicleService();
  late Future<Map<String, dynamic>?> futureInfo;
  late Driver driver;
  late Vehicle vehicle;
  late int driverHasVehicleId;

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
    );

    final cancelButton = CustomButton(
      onTap: () {
        Navigator.pushReplacementNamed(context, 'scannerQr');
      },
      buttonText: 'Escanear nuevo QR',
      buttonColor: Colors.white,
      buttonTextColor: colorMain,
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 4,
      marginTop: 0,
    );

    final btnNewReview = CustomButton(
      onTap: () {},
      buttonText: 'Nueva Reseña',
      buttonColor: colorMain,
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 4,
      marginRight: 0,
      marginTop: 0,
    );

    final buttons = Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(flex: 1, child: cancelButton),
          Expanded(flex: 1, child: btnNewReview)
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: SideMenu(),
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
                          //containerTitle,
                          DriverData(driver),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4.2 ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                RatingBarIndicator(
                                  rating: 4,
                                  itemSize: 25,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: VehicleData(vehicle),
                          ),
                          Expanded(child: buttons),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
