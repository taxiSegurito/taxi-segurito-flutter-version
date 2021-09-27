import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageAccessProvider {
  File? imagen;

  final picker = ImagePicker();

  BuildContext context;

  ImageAccessProvider({
    Key? key,
    required this.context,
  });

  File getImage() {
    return imagen!;
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
