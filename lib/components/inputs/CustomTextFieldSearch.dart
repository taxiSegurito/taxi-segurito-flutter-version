import 'package:flutter/material.dart';

class CustomTextFieldSearch extends StatefulWidget {
  String hint;
  final void Function(String) callbackValueSearch;
  VoidCallback ontap;
  String? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  double heightNum;
  _CustomTextFieldSearchState _customTextFieldState =
      new _CustomTextFieldSearchState();
  CustomTextFieldSearch({
    Key? key,
    required this.ontap,
    required this.callbackValueSearch,
    this.hint = "Campo de texto",
    this.marginLeft = 50,
    this.marginRight = 50,
    this.marginTop = 5,
    this.marginBotton = 5,
    this.heightNum = 35,
  }) : super(key: key);

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
              textInputAction: TextInputAction.search,
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
              onFieldSubmitted: (value) {
                widget.callbackValueSearch(value);
              },
            ),
          )),
        ]));
  }

  String getValue() {
    return valueController.text;
  }
}
