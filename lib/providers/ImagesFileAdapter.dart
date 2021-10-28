import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taxi_segurito_app/providers/ImageAccessProvider.dart';

class ImagesFileAdapter extends StatefulWidget {
  _ImagesFileAdapterState _imagesFileState = new _ImagesFileAdapterState();
  ImageAccessProvider imageAccessProvider = new ImageAccessProvider();
  void Function(String value)? assignValue;

  Image imageDefault = new Image.asset("assets/images/imageDefault.png");
  String? imagePathDefaultUser;

  Image? imageMain;
  String? imageMainBase64;

  final bool isShapeCircle;
  bool isUsingCamera;

  ImagesFileAdapter({
    Key? key,
    this.isUsingCamera = false,
    this.imagePathDefaultUser = '',
    this.isShapeCircle = false,
    this.imageMain,
    this.imageMainBase64 = '',
    this.assignValue,
  }) : super(key: key);

  @override
  _ImagesFileAdapterState createState() {
    return _imagesFileState;
  }

  bool getIsValid() {
    return _imagesFileState.validateImage();
  }

  setImage(Image image) {
    imageMain = image;
  }

  Image getImage() {
    return imageMain!;
  }

  String getImageBase64() {
    return imageMainBase64!;
  }

  Image viewImg64(String imgbase64) {
    return imgbase64.isEmpty
        ? imagePathDefaultUser != null
            ? Image.asset(imagePathDefaultUser!)
            : Image.asset(
                "assets/images/imageDefault.png",
              )
        : Image.memory(imageAccessProvider.viewImage64(imgbase64));
  }
}

class _ImagesFileAdapterState extends State<ImagesFileAdapter> {
  String? imageMessageNotValid;
  @override
  void initState() {
    super.initState();
    widget.imageDefault = widget.imagePathDefaultUser!.isEmpty
        ? widget.imageDefault
        : new Image.asset(widget.imagePathDefaultUser!);

    widget.imageMain = widget.imageMainBase64!.isEmpty
        ? widget.imageDefault
        : widget.viewImg64(widget.imageMainBase64!);
  }

  bool validateImage() {
    if (widget.imageMain == widget.imageDefault) {
      setState(() => imageMessageNotValid = "Seleccione Imagen");
      return false;
    } else {
      setState(() => imageMessageNotValid = null);
      return true;
    }
  }

  openGalery() {
    widget.imageAccessProvider.openGallery().then(
      (_) {
        setState(
          () {
            widget.imageMain =
                Image.file(widget.imageAccessProvider.getImage());
            widget.imageMainBase64 =
                widget.imageAccessProvider.stringImgBase64();
          },
        );
        widget.assignValue!(widget.imageMainBase64!);
      },
    );
  }

  openCamera() {
    widget.imageAccessProvider.openCamera().then(
      (_) {
        setState(
          () {
            widget.imageMain =
                Image.file(widget.imageAccessProvider.getImage());
            widget.imageMainBase64 =
                widget.imageAccessProvider.stringImgBase64();
          },
        );
        widget.assignValue!(widget.imageMainBase64!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (widget.isUsingCamera) {
                openCamera();
              } else {
                openGalery();
              }
            },
            child: Container(
              height: 130,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: widget.isShapeCircle
                      ? null
                      : BorderRadius.all(Radius.circular(0)),
                  image: DecorationImage(
                      image: widget.imageMain!.image, fit: BoxFit.cover),
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
                          offset: Offset(
                            2,
                            2,
                          ),
                          blurRadius: 6,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: width,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: imageMessageNotValid == null
                ? SizedBox()
                : Container(
                    margin: new EdgeInsets.only(),
                    child: Text(
                      imageMessageNotValid ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
