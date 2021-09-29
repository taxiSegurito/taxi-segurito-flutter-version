import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/components/listView/CustomListViewCardSimple.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class CustomShowDialogSearch {
  final void Function(Driver) callback;
  CustomButtonWithLinearBorder? btnCancel;
  BuildContext context;
  String titleShowDialog;

  VoidCallback ontapButtonCancel;
  String buttonCancelText;
  Color buttonCancelColor;
  Color buttonCancelColorBorder;
  Color buttonCancelColotText;

  static const Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  static const Color colorMainText = Colors.white;
  CustomShowDialogSearch(
      {required this.context,
      required this.titleShowDialog,
      required this.ontapButtonCancel,
      required this.buttonCancelText,
      required this.callback,
      this.buttonCancelColor = colorMainText,
      this.buttonCancelColotText = colorMain,
      this.buttonCancelColorBorder = colorMain});

  closeDialog() {
    Navigator.of(context).pop();
  }

  showAlertDialog() {
    btnCancel = new CustomButtonWithLinearBorder(
      onTap: ontapButtonCancel,
      buttonText: buttonCancelText,
      buttonColor: buttonCancelColor,
      buttonTextColor: buttonCancelColotText,
      buttonBorderColor: colorMain,
    );
    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      marginLeft: 50,
      marginRight: 50,
      hint: "Buscar",
      ontap: () {},
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
              child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  title: Text(
                    titleShowDialog,
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.white,
                  content: Container(
                    //color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        txtSearch,
                        Container(
                          child: CustomListViewCardSimple(
                            ontap: () {},
                            callback: (Driver driver) {
                              callback(driver);
                            },
                          ),
                        ),
                        btnCancel!,
                      ],
                    ),
                  )));
        });
  }
}
