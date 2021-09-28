import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  _CustomDropdownButtonState _customDropdownButtonState =
      new _CustomDropdownButtonState();
  String hint;
  String? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  double heightNum;
  List listItem;

  CustomDropdownButton({
    Key? key,
    this.hint = "Campo de text",
    required this.listItem,
    this.marginLeft = 50,
    this.marginRight = 50,
    this.marginTop = 5,
    this.marginBotton = 5,
    this.heightNum = 35,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() {
    return _customDropdownButtonState;
  }

  bool getIsValid() {
    return _customDropdownButtonState.validateDrown();
  }
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? dropdownError;
  Color colorBorder = Colors.grey;
  bool validateDrown() {
    bool isValid = true;

    if (widget.value == null) {
      setState(() => dropdownError = "Campo vacio");
      colorBorder = Colors.red;
      isValid = false;
    } else {
      setState(() => dropdownError = null);
      colorBorder = Colors.grey;
      isValid = true;
    }
    widget.heightNum = 38;
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        child: Column(children: [
      Container(
        margin: new EdgeInsets.only(
            top: widget.marginTop,
            bottom: widget.marginBotton,
            left: widget.marginLeft,
            right: widget.marginRight),
        width: width,
        height: widget.heightNum,
        //alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
          hint: Text(widget.hint),
          value: widget.value,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(fontSize: 13, color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              widget.value = newValue;
            });
          },
          items: widget.listItem.map((valueItem) {
            return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
      Container(
        width: width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: dropdownError == null
            ? SizedBox()
            : Container(
                margin: new EdgeInsets.only(
                    top: widget.marginTop,
                    bottom: widget.marginBotton,
                    left: widget.marginLeft,
                    right: widget.marginRight),
                child: Text(
                  dropdownError ?? "",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                )),
      ),
    ]));
  }
}
