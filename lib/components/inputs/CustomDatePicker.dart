import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  String hint;
  String? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;

  double heightNum;
  _CustomDatePickerState _customTextFieldState = new _CustomDatePickerState();
  CustomDatePicker(
      {Key? key,
      this.hint = "Campo de text",
      this.marginLeft = 50,
      this.marginRight = 50,
      this.marginTop = 5,
      this.marginBotton = 5,
      this.heightNum = 35})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() {
    return _customTextFieldState;
  }

  String getValue() {
    return value = _customTextFieldState.getValue();
  }
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController valueController = TextEditingController();
  String _date = '';

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    changeHeightTextField(double num) {
      setState(() {
        widget.heightNum = num;
      });
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1930),
          lastDate: new DateTime(2025),
          locale: Locale('es', 'ES'));
      if (picked != null) {
        setState(() {
          _date = "${picked.day}-${picked.month}-${picked.year}";
          valueController.text = _date;
        });
      }
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
        enableInteractiveSelection: false,
        textCapitalization: TextCapitalization.sentences,
        validator: (value) {
          if (value!.isEmpty) {
            changeHeightTextField(60);
            return 'Campo vacio';
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
          suffixIcon: Icon(Icons.calendar_today),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: Colors.grey),
          ),
          fillColor: Colors.yellow,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  String getValue() {
    return valueController.text;
  }
}
