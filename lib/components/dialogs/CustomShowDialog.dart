import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';

class CustomDialogShow extends StatefulWidget {
  _CustomDialogShowState _customDialogShowState = new _CustomDialogShowState();

  final VoidCallback? ontap;
  final BuildContext context;
  final Color buttonColor;
  final Color buttonColorText;
  final String titleShowDialog;
  final String buttonText;
  final String? message;

  CustomDialogShow(
      {Key? key,
      this.ontap,
      this.message,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonColorText,
      required this.titleShowDialog,
      required this.context})
      : super(key: key);
  show() {
    _customDialogShowState.showAlertDialog(context, titleShowDialog, ontap,
        buttonText, buttonColor, buttonColorText, message);
  }

  @override
  State<CustomDialogShow> createState() {
    return _customDialogShowState;
  }
}

class _CustomDialogShowState extends State<CustomDialogShow> {
  CustomButton? btnAceptar;
  showAlertDialog(
      BuildContext context,
      String text,
      VoidCallback? ontap,
      String buttonText,
      Color buttonColor,
      Color buttonColorText,
      String? message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          title: Text(
            text,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          content: Text(
            message ?? '',
            textAlign: TextAlign.center,
          ),
          actions: [
            CustomButton(
              onTap: ontap ?? () => Navigator.pop(context),
              buttonText: buttonText,
              buttonColor: buttonColor,
              buttonTextColor: buttonColorText,
              marginTop: 0,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
