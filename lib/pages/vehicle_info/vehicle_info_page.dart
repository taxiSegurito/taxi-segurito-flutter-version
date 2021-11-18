import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/vehicle_reviews.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/widgets/vehicle_picture.dart';

class VehicleInfoPage extends StatelessWidget {
  Vehicle _vehicle;
  VehicleInfoPage(this._vehicle);

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

  @override
  Widget build(BuildContext context) {
    VehiclePicture vehiclePicture = new VehiclePicture(_vehicle);
    PopupMenuItem _popupMenuButton(title, Icon icon, VoidCallback ontap) {
      return PopupMenuItem(
        child: InkWell(
            child: Row(
              children: <Widget>[
                icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            onTap: ontap),
      );
    }

    AppBar appBar = new AppBar(
      centerTitle: true,
      title: Text('Datos Vehiculos'),
      foregroundColor: Colors.white,
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              _popupMenuButton(
                'Editar',
                Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                () {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DriverUpdate(widget._driver)),
                    );*/
                },
              ),
              _popupMenuButton(
                'Eliminar',
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                () {
                  /* showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogDelete(widget._driver);
                        });*/
                },
              ),
              _popupMenuButton(
                  'Asignar Conductor',
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  () {})
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

    Divider divider = new Divider(
      thickness: 0.5,
      color: Colors.black,
    );
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
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vehiclePicture,
          divider,
          _driverAttribute('Modelo', value: _vehicle.model),
          divider,
          _driverAttribute('Color', value: _vehicle.color),
          divider,
          _driverAttribute('Conductor', value: 'Sin conductor')
        ],
      ),
    );
  }
}
