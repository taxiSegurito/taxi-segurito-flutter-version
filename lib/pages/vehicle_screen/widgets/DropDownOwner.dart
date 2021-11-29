import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';
import 'package:taxi_segurito_app/services/owner_service.dart';

class DropDownOwner extends StatefulWidget {
  _DropDownOwnerState _customDropdownButtonState = new _DropDownOwnerState();
  String hint;
  Owner? value;
  double marginLeft;
  double marginRight;
  double marginBotton;
  double marginTop;
  double heightNum;
  int? ownerId;
  List<Owner> listItem;

  DropDownOwner({
    Key? key,
    this.hint = "Campo de texto",
    required this.listItem,
    this.marginLeft = 50,
    this.marginRight = 50,
    this.marginTop = 5,
    this.marginBotton = 5,
    this.heightNum = 35,
    this.ownerId,
  }) : super(key: key);

  @override
  _DropDownOwnerState createState() {
    return _customDropdownButtonState;
  }

  Owner? getValue() {
    return _customDropdownButtonState.dropdown.value;
  }

  bool getIsValid() {
    return _customDropdownButtonState.validateDrown();
  }
}

class _DropDownOwnerState extends State<DropDownOwner> {
  String? dropdownError;
  Color colorBorder = Colors.grey;
  OwnerService _ownerService = OwnerService();
  late Future<List<Owner>> ownersFuture;
  late DropdownButton<Owner> dropdown;
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
    ownersFuture = _ownerService.select();
  }

  Owner? getValue(List<Owner> owners) {
    if (widget.value != null) {
      return widget.value;
    }
    if (widget.ownerId != null) {
      return owners.firstWhere(
          (element) => int.parse(element.idOwner!) == widget.ownerId);
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
            child: FutureBuilder(
              future: ownersFuture,
              builder: (_, AsyncSnapshot<List<Owner>> snapshot) {
                if (snapshot.hasData) {
                  final owners = snapshot.data!;
                  dropdown = DropdownButton<Owner>(
                    hint: Text(widget.hint),
                    value: getValue(owners) ?? owners.first,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    onChanged: (Owner? newValue) {
                      setState(
                        () {
                          widget.value = newValue;
                        },
                      );
                    },
                    items: owners.map(
                      (Owner? valueItem) {
                        return DropdownMenuItem<Owner>(
                          value: valueItem,
                          child: Text(valueItem!.fullName),
                        );
                      },
                    ).toList(),
                  );
                  return dropdown;
                }
                return Center(child: Text('Cargando...'));
              },
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
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
