import 'package:flutter/material.dart';

class CustomTextFieldSearch extends StatefulWidget {
  String hint;
  String? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  bool isValidEmail, isValidName, isValidPassword, isNotNull, isValidPhone;
  double heightNum;
  _CustomTextFieldSearchState _customTextFieldState =
      new _CustomTextFieldSearchState();
  CustomTextFieldSearch(
      {Key? key,
      this.hint = "Campo de text",
      this.marginLeft = 50,
      this.marginRight = 50,
      this.marginTop = 5,
      this.marginBotton = 5,
      this.heightNum = 35,
      this.isValidEmail = false,
      this.isValidName = false,
      this.isValidPassword = false,
      this.isNotNull = false,
      this.isValidPhone = false})
      : super(key: key);

  @override
  State<CustomTextFieldSearch> createState() {
    return _customTextFieldState;
  }

  String getValue() {
    return value = _customTextFieldState.getValue();
  }
}

class _CustomTextFieldSearchState extends State<CustomTextFieldSearch> {
  final TextEditingController valueController = TextEditingController();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    changeHeightTextField(double num) {
      setState(() {
        widget.heightNum = num;
      });
    }

    return Container(
        margin: new EdgeInsets.only(
            top: widget.marginTop,
            bottom: widget.marginBotton,
            left: widget.marginLeft,
            right: widget.marginRight),
        child: Row(children: [
          Expanded(
              child: new Container(
            width: width,
            height: widget.heightNum,
            alignment: Alignment.bottomCenter,
            child: new TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    changeHeightTextField(60);
                    return 'Campo vacio';
                  }

                  if (widget.isValidPassword) {
                    if (!value.isValidPassword) {
                      changeHeightTextField(60);
                      return 'Ingrese contraseña con Mayuscula Números gestos';
                    }
                  }

                  if (widget.isValidPhone) {
                    if (value.isValidPhone) {
                      if (value.isValidName) {
                        changeHeightTextField(60);
                        return 'Ingrese numeros correctos del celular';
                      } else {
                        return null;
                      }
                    }
                  }

                  if (widget.isValidEmail) {
                    if (!value.isValidEmail) {
                      changeHeightTextField(60);
                      return 'Ingrese correctamente su Email';
                    }
                  }

                  if (widget.isValidName) {
                    if (value.isValidPhone) {
                      if (!value.isValidName) {
                        changeHeightTextField(60);
                        return 'No se permiten numeros';
                      }
                    }
                  }
                  changeHeightTextField(35);
                },
                textAlignVertical: TextAlignVertical.center,
                controller: valueController,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 13, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: widget.hint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                  fillColor: Colors.yellow,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )),
          )),
          Container(
            //color: Colors.red,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ]));
  }

  String getValue() {
    return valueController.text;
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = new RegExp(r'[a-z]');

    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'[0-9]');

    return phoneRegExp.hasMatch(this);
  }

  bool get isValidDate {
    final dateRegExp = RegExp(r'(\d{4}-?\d\d-?\d\d(\s|T)\d\d:?\d\d:?\d\d)');
    return dateRegExp.hasMatch(this);
  }
}
