import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomTextFieldSearch extends StatefulWidget {
  String hint;
  VoidCallback ontap;
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
      required this.ontap,
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
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
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
                changeHeightTextField(35);
              },
              textAlignVertical: TextAlignVertical.center,
              controller: valueController,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 13, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  isDense: true,
                  hintText: widget.hint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 0, color: Colors.grey.withOpacity(0)),
                  ),
                  fillColor: Colors.yellow,
                  border: InputBorder.none),
            ),
          )),
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