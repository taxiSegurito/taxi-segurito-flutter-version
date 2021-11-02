import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  VoidCallback onTap;
  RefreshButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      Icons.replay,
      color: Colors.grey,
      size: 30,
    );
    return Container(
      margin: EdgeInsets.only(left: 2),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        onTap: onTap,
        child: icon,
      ),
    );
  }
}
