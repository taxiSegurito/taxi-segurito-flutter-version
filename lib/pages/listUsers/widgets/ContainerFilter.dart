import 'package:flutter/material.dart';

class ContainerFilter extends StatefulWidget {
  ContainerFilter({Key? key}) : super(key: key);

  @override
  _ContainerFilterState createState() => _ContainerFilterState();
}

class _ContainerFilterState extends State<ContainerFilter> {
  Icon icon = Icon(
    Icons.arrow_drop_down,
    color: Colors.grey,
    size: 30,
  );
  updateIcon() {
    setState(() {
      icon = Icon(
        Icons.arrow_drop_up,
        color: Colors.grey,
        size: 30,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2),
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: () {
          updateIcon();
        },
        child: Row(
          children: [
            Expanded(
              child: new Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Filtrado por",
                        style: const TextStyle(
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.center),
                    icon
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
