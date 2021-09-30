import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/sidemenu/side_menu.dart';

class MenuButtonsRegister extends StatefulWidget {
  Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  Color colorMainText = Colors.white;
  MenuButtonsRegister({Key? key}) : super(key: key);

  @override
  _MenuButtonsRegisterState createState() => _MenuButtonsRegisterState();
}

class _MenuButtonsRegisterState extends State<MenuButtonsRegister> {
  @override
  Widget build(BuildContext context) {
    CustomButton btnOne = new CustomButton(
        onTap: () {
          Navigator.pushNamed(context, "registerVehicle");
        },
        buttonText: "Registrar Vehiculo",
        buttonColor: widget.colorMain,
        buttonTextColor: widget.colorMainText);
    CustomButtonWithLinearBorder btnTwo = new CustomButtonWithLinearBorder(
        onTap: () {
          Navigator.pushNamed(context, "registerCompany");
        },
        buttonText: "Registrar Empresa",
        buttonColor: widget.colorMainText,
        buttonTextColor: widget.colorMain,
        buttonBorderColor: widget.colorMain);
    CustomButton btnThree = new CustomButton(
        onTap: () {
          Navigator.pushNamed(context, "registerOwner");
        },
        buttonText: "Registrar Dueño",
        buttonColor: widget.colorMain,
        buttonTextColor: widget.colorMainText);

    Image gifTaxi = Image.asset(
      "lib/components/assets/images/taxi.gif",
      width: 200,
    );

    Container containerImage = new Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: gifTaxi,
    );
    AppBar appBar = new AppBar(
      backgroundColor: widget.colorMain,
      elevation: 0,
    );
    Text title = new Text(
      "¿Que desea registrar?",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.center,
    );

    Container containerTitle = new Container(
        alignment: Alignment.center,
        margin: new EdgeInsets.only(
            top: 20.0, bottom: 10.0, left: 35.0, right: 35.0),
        child: title);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: appBar,
        drawer: SideMenu(),
        body: Container(
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerTitle,
              containerImage,
              btnOne,
              btnTwo,
              btnThree,
            ],
          ),
        ));
  }
}
