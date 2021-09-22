// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageAccessProvider {
  File? imagen = null;
  State state;
  final picker = ImagePicker();
  VoidCallback? onTap;
  BuildContext context;

  setOntap(VoidCallback ontap) {
    this.onTap = ontap;
  }

  ImageAccessProvider({
    Key? key,
    required this.context,
    required this.state,
  });

  File getImage() {
    //return Image.file(imagen);
    return imagen!;
  }

  Future openGalery() async {
    var pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setStateImage(pickedFile);
  }

  setStates() {
    /*if (onTap != null) {*/
    onTap!();
    /*}*/
  }

  Widget _setImageView() {
    if (imagen != null) {
      File s = (imagen) as File;
      return Image.file(
        s,
        width: 100,
        height: 100,
      );
    } else {
      return Text("Please select an image");
    }
  }

  void setStateImage(var pickedFile) {
    // state.setState(() {
    if (pickedFile != null) {
      imagen = File(pickedFile.path);
      Fluttertoast.showToast(
          msg: "si hay imagen",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
      //setStates();
      //closeNavigator();
    }
    // });
  }

  void closeNavigator() {
    //Navigator.of(context).pop();
  }
}
