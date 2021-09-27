import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageAccessProvider {
  File imagen = File("lib/components/assets/images/auto.png");
  final picker = ImagePicker();

  ImageAccessProvider({
    Key? key,
  });

  File getImage() {
    return imagen;
  }

  Future openGalery() async {
    var pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setStateImage(pickedFile);
  }

  void setStateImage(var pickedFile) {
    if (pickedFile != null) {
      imagen = File(pickedFile.path);
    }
  }
}
