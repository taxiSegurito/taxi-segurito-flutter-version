import 'package:flutter/material.dart';

class ContainerUser extends StatefulWidget {
  final void Function(dynamic dynamicObject) callback;
  dynamic dynamicObject;
  ContainerUser({Key? key, this.dynamicObject, required this.callback})
      : super(key: key);

  @override
  _ContainerUserState createState() => _ContainerUserState();
}

class _ContainerUserState extends State<ContainerUser> {
  @override
  Widget build(BuildContext context) {
    Image imagedefault = new Image.asset(
      "lib/components/assets/images/userDefault.png",
    );
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    Container containerCredentialsColumnOne = new Container(
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imagedefault.image, fit: BoxFit.cover),
                shape: BoxShape.circle),
          )),
    );

    Container containerCredentialsColumnTwo = new Container(
        margin: EdgeInsets.only(left: 10),
        height: 60,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              child: Text(
                widget.dynamicObject.fullName,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600),
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      "CI:",
                      style: TextStyle(
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                  Text(
                    widget.dynamicObject.ci,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Icon(
                      Icons.phone,
                      size: 17,
                      color: Color.fromRGBO(207, 207, 207, 1),
                    ),
                  ),
                  Text(
                    widget.dynamicObject.cellPhone,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              alignment: Alignment.centerLeft,
            ),
          ],
        )));
    Container containerCredentialsColumnThree = new Container(
        height: 60,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Text(
                "Dueño",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w400),
              ),
              alignment: Alignment.topRight,
            ),
          ],
        )));

    Container container = new Container(
        height: 110,
        color: Color.fromRGBO(246, 246, 246, 1),
        margin:
            new EdgeInsets.only(top: 5.0, bottom: 5.0, left: 00.0, right: 00.0),
        child: Material(
            child: InkWell(
                splashColor: colorMain,
                onTap: () {
                  widget.callback(widget.dynamicObject);
                },
                child: Container(
                  margin: new EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Expanded(flex: 0, child: containerCredentialsColumnOne),
                      Expanded(flex: 1, child: containerCredentialsColumnTwo),
                      Expanded(flex: 0, child: containerCredentialsColumnThree),
                    ],
                  ),
                ))));

    return container;
  }
}
