import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Driver.dart';

class SelectDriverCard extends StatefulWidget {
  _SelectDriverCardState _customCardSimpleState = new _SelectDriverCardState();
  String? headerText;
  String? namePerson;
  String? ciPerson;
  String? phonePerson;
  VoidCallback ontap;
  VoidCallback ontapCloseDialog;
  Driver driver = new Driver();
  SelectDriverCard(
      {Key? key,
      required this.ontap,
      required this.headerText,
      required this.ontapCloseDialog,
      required this.driver})
      : super(key: key);

  @override
  _SelectDriverCardState createState() {
    return _customCardSimpleState;
  }

  updateParamaters(Driver driver) {
    _customCardSimpleState.updateParamaters(driver);
  }

  bool getIsValid() {
    return _customCardSimpleState.validateDrown();
  }

  Driver? getDriver() {
    return driver;
  }
}

class _SelectDriverCardState extends State<SelectDriverCard> {
  updateParamaters(Driver driver) {
    setState(() {
      widget.driver = driver;
      widget.ciPerson = driver.dni;
      widget.namePerson = driver.name;
      widget.phonePerson = driver.phone;
    });
    widget.ontapCloseDialog();
  }

  String? errorMessage;
  Color colorBorder = Colors.transparent;
  bool validateDrown() {
    bool isValid = true;

    if (widget.driver.dni == null) {
      setState(() => errorMessage = "Campo vacio");
      colorBorder = Colors.red;
      isValid = false;
    } else {
      setState(() => errorMessage = null);
      colorBorder = Colors.transparent;
      isValid = true;
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Card(
          shape: Border.all(color: colorBorder),
          borderOnForeground: true,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.headerText!,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              InkWell(
                child: ListTile(
                  title: widget.driver.name.isEmpty
                      ? Text(
                          "no seleccionado",
                          style: TextStyle(fontSize: 13),
                        )
                      : Text(
                          widget.driver.name,
                          style: TextStyle(fontSize: 13),
                        ),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: widget.driver.dni.isEmpty
                            ? Text(
                                "CI: " + "00000000",
                                style: TextStyle(fontSize: 13),
                              )
                            : Text(
                                "CI: " + widget.driver.dni,
                                style: TextStyle(fontSize: 13),
                              ),
                      ),
                      Expanded(
                        child: widget.driver.phone.isEmpty
                            ? Text(
                                "Celular: " + "00000000",
                                style: TextStyle(fontSize: 13),
                              )
                            : Text(
                                "Celular: " + widget.driver.phone,
                                style: TextStyle(fontSize: 13),
                              ),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.add),
                ),
                onTap: () {
                  widget.ontap();
                },
              )
            ],
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: errorMessage == null
              ? SizedBox()
              : Container(
                  margin: new EdgeInsets.only(),
                  child: Text(
                    errorMessage ?? "",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
        ),
      ],
    );
  }
}
