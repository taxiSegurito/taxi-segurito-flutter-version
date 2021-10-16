import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageAccessProvider {
  File? imagen;
  late File imgdos;
  late Uint8List by8timg;
  final picker = ImagePicker();

  ImageAccessProvider({
    Key? key,
  });

  File getImage() {
    return imagen!;
  }

  String stringImgBase64() {
    String imgString;
    return imgString = base64Encode(imgdos.readAsBytesSync());
  }

  Future openGallery() async {
    var pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setStateImage(pickedFile);
  }

  void setStateImage(var pickedFile) {
    if (pickedFile != null) {
      imagen = File(pickedFile.path);
      imgdos = File(pickedFile.path);
    }
  }

  Future openCamera() async {
    var pickedimg = await ImagePicker().pickImage(source: ImageSource.camera);
    setStateImage(pickedimg);
  }

  //leer iamgen de base 64
  Uint8List viewImage64(String img64) {
    return Base64Decoder().convert(img64);
  }
}
