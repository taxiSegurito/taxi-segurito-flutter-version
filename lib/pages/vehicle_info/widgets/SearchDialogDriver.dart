import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/models/driver.dart';
import 'package:taxi_segurito_app/pages/vehicle_info/widgets/list_view_driver.dart';

class SearchDialogDriver {
  final void Function(Driver) callback;
  final void Function(String) callbackValueSearch;
  CustomButtonWithLinearBorder? btnCancel;
  CustomButton? btnAssign;
  BuildContext context;
  String titleShowDialog;

  VoidCallback ontapButtonCancel;
  String buttonCancelText;
  Color buttonCancelColor;
  Color buttonCancelColorBorder;
  Color buttonCancelColotText;

  List<Driver> listDriver;

  static const Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  static const Color colorMainText = Colors.white;
  SearchDialogDriver(
      {required this.context,
      required this.listDriver,
      required this.titleShowDialog,
      required this.ontapButtonCancel,
      required this.buttonCancelText,
      required this.callback,
      required this.callbackValueSearch,
      this.buttonCancelColor = colorMainText,
      this.buttonCancelColotText = colorMain,
      this.buttonCancelColorBorder = colorMain});

  closeDialog() {
    Navigator.of(context).pop();
  }

  showAlertDialog() {
    ListViewDrivers listView = new ListViewDrivers(
      listDrivers: listDriver,
      ontap: () {},
      callback: (Driver driver) {
        callback(driver);
        closeDialog();
      },
    );

    void _searchDriver(String value) {
      /* setState(() {
      drivers = _driversService.getByCriteria(value);
    });*/
    }

    btnCancel = new CustomButtonWithLinearBorder(
      onTap: ontapButtonCancel,
      buttonText: buttonCancelText,
      buttonColor: buttonCancelColor,
      buttonTextColor: buttonCancelColotText,
      buttonBorderColor: colorMain,
      marginLeft: 0,
      marginRight: 5,
    );
    btnAssign = new CustomButton(
      onTap: () {},
      buttonText: 'Guardar',
      buttonColor: colorMain,
      buttonTextColor: Colors.white,
      marginLeft: 5,
      marginRight: 0,
    );
    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      marginLeft: 50,
      marginRight: 50,
      hint: "Buscar",
      ontap: () {},
      callbackValueSearch: _searchDriver,
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
            title: Text(
              titleShowDialog,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  txtSearch,
                  Container(child: listView),
                  Row(
                    children: [
                      Expanded(child: btnCancel!),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
