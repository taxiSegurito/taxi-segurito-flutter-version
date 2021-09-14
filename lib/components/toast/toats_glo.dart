import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast = FToast();

class GlobalToast {
  static Widget toast(Text msg, Color color, Icon icons) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icons,
            SizedBox(
              width: 12.0,
            ),
            msg,
          ],
        ),
      ),
    );
  }

  static displayToast(Text text, Color color, Icon icon, int duration) {
    fToast.showToast(
        child: toast(text, color, icon),
        toastDuration: Duration(seconds: duration));
  }
}
