import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';

class CustomShowDialogMenu {
  CustomButton? btnOne;
  CustomButtonWithLinearBorder? btnTwo;
  CustomButton? btnThree;
  BuildContext context;
  String titleShowDialog;
  VoidCallback ontapButtonOne;
  String buttonOneText;

  Color buttonOneColor;
  Color buttonTwoColor;
  Color buttonThreeColor;

  Color buttonTextOneColor;
  Color buttonTextTwoColor;
  Color buttonTextThreeColor;
  VoidCallback ontapButtonTwo;
  String buttonTwoText;
  VoidCallback ontapButtonThree;
  String buttonThreeText;
  static const Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  static const Color colorMainText = Colors.white;
  CustomShowDialogMenu(
      {required this.context,
      required this.titleShowDialog,
      required this.ontapButtonOne,
      required this.buttonOneText,
      this.buttonOneColor = colorMain,
      this.buttonTwoColor = colorMain,
      this.buttonThreeColor = colorMain,
      this.buttonTextOneColor = colorMainText,
      this.buttonTextTwoColor = colorMainText,
      this.buttonTextThreeColor = colorMainText,
      required this.ontapButtonTwo,
      required this.buttonTwoText,
      required this.ontapButtonThree,
      required this.buttonThreeText});

  closeDialog() {
    Navigator.of(context).pop();
  }

  showAlertDialog() {
    Image gifTaxi = Image.asset(
      "lib/components/assets/images/taxi.gif",
      width: 200,
    );

    btnOne = new CustomButton(
        onTap: ontapButtonOne,
        buttonText: buttonOneText,
        buttonColor: buttonOneColor,
        buttonTextColor: buttonTextOneColor);

    btnTwo = new CustomButtonWithLinearBorder(
      onTap: ontapButtonTwo,
      buttonText: buttonTwoText,
      buttonColor: buttonTwoColor,
      buttonTextColor: buttonTextTwoColor,
      buttonBorderColor: colorMain,
    );

    btnThree = new CustomButton(
        onTap: ontapButtonThree,
        buttonText: buttonThreeText,
        buttonColor: buttonThreeColor,
        buttonTextColor: buttonTextThreeColor);

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
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
                  children: [gifTaxi, btnOne!, btnTwo!, btnThree!],
                ),
              ));
        });
  }
}
