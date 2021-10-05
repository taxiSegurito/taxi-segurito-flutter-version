import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';

class ImagesFile extends StatefulWidget {
  _ImagesFileState _imagesFileState = new _ImagesFileState();
  final bool isImageUserDefault, isImageCarDefault, isShapeCircle;
  late Image imageCar;
  bool isActiveImageDefault = true;
  ImagesFile({
    Key? key,
    this.isImageUserDefault = false,
    this.isImageCarDefault = false,
    this.isShapeCircle = false,
  }) : super(key: key);

  @override
  _ImagesFileState createState() {
    return _imagesFileState;
  }

  Image getImage() {
    return imageCar;
  }
}

class _ImagesFileState extends State<ImagesFile> {
  ImageAccessProvider imageAccessProvider = new ImageAccessProvider();

  openGalery() {
    imageAccessProvider.openGallery().then((_) {
      setState(() {
        widget.isActiveImageDefault = false;
        widget.imageCar = Image.file(imageAccessProvider.getImage());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Image imagedefault;
    if (widget.isActiveImageDefault) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/imageDefault.png",
      );
      widget.imageCar = imagedefault;
    }

    if (widget.isImageCarDefault && widget.isActiveImageDefault) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/carDefault.png",
      );
      widget.imageCar = imagedefault;
    }
    if (widget.isImageUserDefault && widget.isActiveImageDefault) {
      imagedefault = new Image.asset(
        "lib/components/assets/images/userDefault.png",
      );
      widget.imageCar = imagedefault;
    }

    return InkWell(
        onTap: () {
          openGalery();
        },
        child: Container(
            width: 250,
            height: 125,
            decoration: BoxDecoration(
                image: DecorationImage(image: widget.imageCar.image),
                shape: widget.isShapeCircle
                    ? BoxShape.circle
                    : BoxShape.rectangle),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ))
                ])));
  }
}
