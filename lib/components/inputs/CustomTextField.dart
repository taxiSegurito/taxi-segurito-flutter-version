import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String hint;
  String? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  bool isValidEmail, isValidString, isValidPassword, isValidNumber;
  String msgValidEmail, msgValidString, msgValidPassword, msgValidNumber;
  double heightNum;
  _CustomTextFieldState _customTextFieldState = new _CustomTextFieldState();
  CustomTextField(
      {Key? key,
      this.hint = "Campo de text",
      this.marginLeft = 50,
      this.marginRight = 50,
      this.marginTop = 5,
      this.marginBotton = 5,
      this.heightNum = 35,
      this.isValidEmail = false,
      this.isValidString = false,
      this.isValidPassword = false,
      this.isValidNumber = false,
      this.msgValidEmail = '',
      this.msgValidNumber = '',
      this.msgValidPassword = '',
      this.msgValidString = ''})
      : super(key: key);

  @override
  State<CustomTextField> createState() {
    return _customTextFieldState;
  }

  String getValue() {
    return value = _customTextFieldState.getValue();
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController valueController = TextEditingController();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    changeHeightTextField(double num) {
      setState(() {
        widget.heightNum = num;
      });
    }

    return new Container(
      margin: new EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBotton,
          left: widget.marginLeft,
          right: widget.marginRight),
      width: width,
      height: widget.heightNum,
      alignment: Alignment.bottomCenter,
      child: new TextFormField(
          textCapitalization: TextCapitalization.sentences,
          validator: (value) {
            if (value!.isEmpty) {
              changeHeightTextField(60);
              return 'Campo vacio';
            }

            if (widget.isValidPassword) {
              if (!value.isValidPassword) {
                changeHeightTextField(60);
                return widget.msgValidPassword;
              }
            }

            if (widget.isValidNumber) {
              if (value.isValidString) {
                changeHeightTextField(60);
                return widget.msgValidNumber;
              }
            }

            if (widget.isValidEmail) {
              if (!value.isValidEmail) {
                changeHeightTextField(60);
                return widget.msgValidEmail;
              }
            }

            if (widget.isValidString) {
              if (value.isValidNumber) {
                changeHeightTextField(60);
                return widget.msgValidString;
              }
            }

            changeHeightTextField(40);
          },
          textAlignVertical: TextAlignVertical.center,
          controller: valueController,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 13),
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
    );
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

  bool get isValidString {
    final nameRegExp = new RegExp(r'[a-zA-Z]');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        new RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidNumber {
    final phoneRegExp = RegExp((r'[0-9]'));
    return phoneRegExp.hasMatch(this);
  }
}
