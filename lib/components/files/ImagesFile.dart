import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';

class ImagesFile extends StatefulWidget {
  _ImagesFileState _imagesFileState = new _ImagesFileState();
  ImagesFile({Key? key}) : super(key: key);

  @override
  _ImagesFileState createState() {
    return _imagesFileState;
  }

  /*openGalery() {
    _imagesFileState.openGalery();
  }*/
}

class _ImagesFileState extends State<ImagesFile> {
  Image imageCar = new Image.asset(
    "lib/components/assets/images/auto.png",
    height: 150,
    width: 150,
  );

  ImageAccessProvider imageAccessProvider = new ImageAccessProvider();
/*
  openGalery() {
    imageAccessProvider.openGalery().then((_) {
      setState(() {
        imageCar = Image.file(imageAccessProvider.getImage());
      });
    });*
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imageCar,
    );
  }
}
