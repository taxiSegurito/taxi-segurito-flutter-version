import 'package:flutter/material.dart';

class StalesDialog extends StatefulWidget {
  StalesDialog({Key? key}) : super(key: key);

  @override
  _StalesDialogState createState() => _StalesDialogState();
}

class _StalesDialogState extends State<StalesDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        title: Text(
          "titleShowDialog",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        content: Container(
          //color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //gifTaxi,
              Container(
                  /*child: CustomListViewCardSimpe(
                  ontap: () {},
                ),
              ),*/
                  //btnCancel!,
                  )
            ],
          ),
        ));
  }
}
