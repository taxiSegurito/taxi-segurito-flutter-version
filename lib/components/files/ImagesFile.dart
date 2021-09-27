import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';

class ImagesFile extends StatefulWidget {
  _ImagesFileState _imagesFileState = new _ImagesFileState();
  bool imageUser, imageCar;

  ImagesFile({
    Key? key,
    this.imageUser = false,
    this.imageCar = false,
  }) : super(key: key);

  @override
  _ImagesFileState createState() {
    return _imagesFileState;
  }

  openGalery() {
    _imagesFileState.openGalery();
  }
}

class _ImagesFileState extends State<ImagesFile> {
  ImageAccessProvider imageAccessProvider = new ImageAccessProvider();
  late Image imageCar;
  bool key = true;

  openGalery() {
    imageAccessProvider.openGalery().then((_) {
      setState(() {
        key = false;
        imageCar = Image.file(imageAccessProvider.getImage());
      });
    });
  }

  @override
  Image build(BuildContext context) {
    Image imagedefault;
    if (key) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/imageDefault.png",
      );
      imageCar = imagedefault;
    }

    if (widget.imageCar && key) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/carDefault.png",
      );
      imageCar = imagedefault;
    }
    if (widget.imageUser && key) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/userDefault.png",
      );
      imageCar = imagedefault;
    }
    return imageCar;
  }
}
