import 'package:flutter/material.dart';

class ContainerReplayList extends StatefulWidget {
  VoidCallback onTap;
  ContainerReplayList({Key? key, required this.onTap}) : super(key: key);

  @override
  _ContainerReplayListState createState() => _ContainerReplayListState();
}

class _ContainerReplayListState extends State<ContainerReplayList> {
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
        onTap: widget.onTap,
        child: icon,
      ),
    );
  }
}
