import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/company.dart';

class DropDownCompany extends StatefulWidget {
  _DropDownCompanyState _customDropdownButtonState =
      new _DropDownCompanyState();
  String hint;
  Company? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  double heightNum;
  List<Company> listItem;

  DropDownCompany({
    Key? key,
    this.hint = "Campo de text",
    required this.listItem,
    this.marginLeft = 50,
    this.marginRight = 50,
    this.marginTop = 5,
    this.marginBotton = 5,
    this.heightNum = 35,
    this.value,
  }) : super(key: key);

  @override
  _DropDownCompanyState createState() {
    return _customDropdownButtonState;
  }

  Company? getValue() {
    return value;
  }

  bool getIsValid() {
    return _customDropdownButtonState.validateDrown();
  }
}

class _DropDownCompanyState extends State<DropDownCompany> {
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
  void initState() {
    super.initState();
    if (!(widget.listItem.isEmpty)) {
      widget.value = widget.listItem.firstWhere(
          (element) => (element.idCompany == widget.value!.idCompany));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            margin: new EdgeInsets.only(
                top: widget.marginTop,
                bottom: widget.marginBotton,
                left: widget.marginLeft,
                right: widget.marginRight),
            width: width,
            height: widget.heightNum,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: colorBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<Company>(
              hint: Text(widget.hint),
              value: widget.value,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(fontSize: 13, color: Colors.black),
              onChanged: (Company? newValue) {
                setState(
                  () {
                    widget.value = newValue;
                  },
                );
              },
              items: widget.listItem.map(
                (Company? valueItem) {
                  return DropdownMenuItem<Company>(
                    value: valueItem,
                    child: Text(valueItem!.companyName),
                  );
                },
              ).toList(),
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
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
