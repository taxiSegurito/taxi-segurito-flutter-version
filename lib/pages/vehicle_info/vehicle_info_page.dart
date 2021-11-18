import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/models/vehicle.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/vehicle_reviews.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/widgets/SearchDialogDriver.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/widgets/vehicle_picture.dart';
import 'package:taxi_segurito_app/services/driver_service.dart';

class VehicleInfoPage extends StatefulWidget {
  Vehicle? vehicle;
  Driver? driver;
  bool isEdit = false;
  VehicleInfoPage(this.vehicle, {Key? key}) : super(key: key);

  @override
  _VehicleInfoPageState createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  static const Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  static const Color colorMainText = Colors.white;
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
    VehiclePicture vehiclePicture = new VehiclePicture(widget.vehicle!);
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

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    callBackSendData(Driver driver) {
      setState(() {
        widget.driver = driver;
        widget.isEdit = true;
      });
    }

    SearchDialogDriver searchDialogDriver = new SearchDialogDriver(
      context: context,
      titleShowDialog: 'Lista de Conductores',
      ontapButtonCancel: () => closeNavigator(context),
      buttonCancelText: "Cancelar",
      callback: callBackSendData,
      callbackValueSearch: (value) {},
      listDriver: [],
    );

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
                  ), () {
                searchDialogDriver.showAlertDialog();
              })
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

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        setState(() {
          widget.isEdit = false;
          widget.driver = null;
        });
      },
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: colorMain,
      buttonBorderColor: colorMainText,
      marginLeft: 0,
      marginRight: 5,
    );
    CustomButton btnAssign = new CustomButton(
      onTap: () {},
      buttonText: 'Guardar',
      buttonColor: colorMain,
      buttonTextColor: Colors.white,
      marginLeft: 5,
      marginRight: 0,
    );

    Widget _buttonsAction() {
      return widget.isEdit
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  Expanded(
                    child: btnCancel,
                  ),
                  Expanded(
                    child: btnAssign,
                  ),
                ],
              ),
            )
          : Container();
    }

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
                            builder: (context) =>
                                VehicleReviewsPage(widget.vehicle!)),
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
          _driverAttribute('Modelo', value: widget.vehicle!.model),
          divider,
          _driverAttribute('Color', value: widget.vehicle!.color),
          divider,
          Container(
              color: widget.isEdit ? Color.fromRGBO(241, 241, 241, 1) : null,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  _driverAttribute(
                    'Conductor',
                    value: widget.driver != null
                        ? widget.driver!.fullName
                        : 'Sin conductor',
                  ),
                  _buttonsAction()
                ],
              ))
        ],
      ),
    );
  }
}
