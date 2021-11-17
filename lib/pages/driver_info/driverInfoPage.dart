import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/driver_info/widgets/driver_data.dart';
import 'package:taxi_segurito_app/pages/driver_info/widgets/vehicle_data.dart';
import 'package:taxi_segurito_app/services/driver_vehicle_service.dart';

// ignore: must_be_immutable
class DriverInfoPage extends StatefulWidget {
  Driver _driver;
  Vehicle? _vehicle;
  int? _driverHasVehicleId;
  DriverInfoPage(this._driver, {Key? key}) : super(key: key);

  @override
  DriverInfoPageState createState() => DriverInfoPageState();
}

class DriverInfoPageState extends State<DriverInfoPage> {
  final _driverVehicleService = DriverVehicleService();
  late Future<Map<String, dynamic>?> futureInfo;
  Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  Color colorMainDanger = Color.fromRGBO(242, 78, 30, 1);
  Color colorMainNull = Color.fromRGBO(153, 153, 153, 1);
  @override
  void initState() {
    super.initState();
    futureInfo =
        _driverVehicleService.getAssignationByDriverId(widget._driver.idPerson);
  }

  @override
  Widget build(BuildContext context) {
    DriverData driverData = new DriverData(widget._driver);
    Divider divider = new Divider(
      thickness: 0.5,
      color: Colors.black,
    );

    showAlertDialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            title: Text(
              "¿Esta se seguro de eliminar a ${widget._driver.fullName}?",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            content: Row(
              children: [
                Expanded(
                  child: CustomButtonWithLinearBorder(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonBorderColor: colorMainNull,
                      marginBotton: 0,
                      marginLeft: 0,
                      marginRight: 0,
                      marginTop: 0,
                      buttonText: "Cancelar",
                      buttonColor: Colors.white,
                      buttonTextColor: colorMainNull),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButtonWithLinearBorder(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonBorderColor: colorMainDanger,
                      marginBotton: 0,
                      marginLeft: 0,
                      marginRight: 0,
                      marginTop: 0,
                      buttonText: "Eliminar",
                      buttonColor: Colors.white,
                      buttonTextColor: colorMainDanger),
                ),
              ],
            ),
          );
        },
      );
    }

    AppBar appBar = new AppBar(
      centerTitle: true,
      title: Text('Datos Conductor'),
      foregroundColor: Colors.white,
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        'Editar',
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        'Eliminar',
                        style: TextStyle(color: Color.fromRGBO(242, 78, 30, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  onTap: () {
                    showAlertDialog();
                  },
                ),
              )
            ];
          },
        )
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          );
        },
      ),
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
                    widget._driver = snapshot.data!['driver'] as Driver;
                    widget._vehicle = snapshot.data!['vehicle'] as Vehicle;
                    widget._driverHasVehicleId =
                        snapshot.data!['idDriverHasVehicle'];
                    return Column(
                      children: [
                        driverData,
                        divider,
                        _driverAttribute("Carnet de identidad",
                            value: widget._driver.ci),
                        divider,
                        _driverAttribute("Celular",
                            value: widget._driver.cellphone),
                        divider,
                        _driverAttribute("Licencia",
                            value: widget._driver.license),
                        divider,
                        _driverAttribute(
                          "Vehículo asignado",
                        ),
                        VehicleData(widget._vehicle!),
                      ],
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

  Widget _driverAttribute(
    title, {
    String value = '',
    double fontsize = 20.0,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "$title:",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Raleway',
                fontSize: fontsize,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: fontsize,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
