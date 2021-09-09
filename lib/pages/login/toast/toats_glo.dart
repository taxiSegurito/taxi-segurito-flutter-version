import 'package:flutter/material.dart';

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
}
