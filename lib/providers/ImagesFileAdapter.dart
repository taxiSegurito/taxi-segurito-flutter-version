import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';

class ImagesFileAdapter extends StatefulWidget {
  _ImagesFileAdapterState _imagesFileState = new _ImagesFileAdapterState();
  final bool isShapeCircle;
  late Image imageCar;
  late Uint8List imageConvert64;
  String? imagePath;
  late String base64Img;
  bool isUsingCamera;
  ImageAccessProvider imageAccessProvider = new ImageAccessProvider();
  bool isActiveImageDefault = true;
  ImagesFileAdapter({
    Key? key,
    this.isUsingCamera = false,
    this.imagePath,
    this.isShapeCircle = false,
  }) : super(key: key);

  @override
  _ImagesFileAdapterState createState() {
    return _imagesFileState;
  }

  bool getIsValid() {
    return _imagesFileState.validateDrown();
  }

  Image getImage() {
    return imageCar;
  }

  String getImgBase64() {
    return base64Img;
  }

  //visualizar imagen de base 64
  Image viewImg64(String imgbase64) {
    return Image.memory(imageAccessProvider.viewImage64(imgbase64));
  }
}

class _ImagesFileAdapterState extends State<ImagesFileAdapter> {
  String? dropdownError;
  Color colorBorder = Colors.grey;
  bool validateDrown() {
    bool isValid = true;

    if (widget.isActiveImageDefault) {
      setState(() => dropdownError = "Seleccione Imagen");
      colorBorder = Colors.red;
      isValid = false;
    } else {
      setState(() => dropdownError = null);
      colorBorder = Colors.grey;
      isValid = true;
    }
    return isValid;
  }

  openGalery() {
    widget.imageAccessProvider.openGallery().then((_) {
      setState(() {
        widget.isActiveImageDefault = false;
        widget.imagePath = null;
        widget.imageCar = Image.file(widget.imageAccessProvider.getImage());
        widget.base64Img = widget.imageAccessProvider.stringImgBase64();
      });
    });
  }

  openCamera() {
    widget.imageAccessProvider.openCamera().then((_) {
      setState(() {
        widget.isActiveImageDefault = false;
        widget.imagePath = null;
        widget.imageCar = Image.file(widget.imageAccessProvider.getImage());
        widget.base64Img = widget.imageAccessProvider.stringImgBase64();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Image imagedefault;
    if (widget.isActiveImageDefault) {
      imagedefault = new Image.asset(
        "assets/images/imageDefault.png",
      );
      widget.imageCar = imagedefault;
    }

    if (widget.imagePath != null) {
      imagedefault = new Image.asset(widget.imagePath!);
      widget.imageCar = imagedefault;
    }

    return Column(children: [
      InkWell(
          onTap: () {
            if (widget.isUsingCamera) {
              openCamera();
            } else {
              openGalery();
            }
          },
          child: Container(
              width: 115,
              height: 115,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: widget.imageCar.image, fit: BoxFit.cover),
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
                  ]))),
      Container(
        width: width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: dropdownError == null
            ? SizedBox()
            : Container(
                margin: new EdgeInsets.only(),
                child: Text(
                  dropdownError ?? "",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                )),
      ),
    ]);
  }
}
