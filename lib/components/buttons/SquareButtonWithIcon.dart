import 'package:flutter/material.dart';

class SquareButtonWithIcon extends StatelessWidget {
  final String text = "hi >:D";
  final String iconPath = "";

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.amber.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(iconPath)),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
