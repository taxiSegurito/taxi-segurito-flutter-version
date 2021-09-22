import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
//import 'package:taxi_segurito_aponents/buttons/CustomButtonWithLinearBorder.dart';

import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/providers/imageAccessProvider.dart';

class RegisterOwnerAndVehicle extends StatefulWidget {
  RegisterOwnerAndVehicle({Key? key}) : super(key: key);

  @override
  _RegisterOwnerAndVehicleState createState() =>
      _RegisterOwnerAndVehicleState();
}

class _RegisterOwnerAndVehicleState extends State<RegisterOwnerAndVehicle> {
  Image imageAuto = new Image.asset(
    "lib/components/assets/images/auto.png",
    height: 150,
    width: 150,
  );

  File? imagen = null;
  final picker = ImagePicker();

  Future selImagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        imageAuto = Image.file(imagen!);
      } else {
        print("no se selecionaste");
      }
    });

    Navigator.of(context).pop();
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    selImagen(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Tomar una foto",
                          style: TextStyle(fontSize: 16),
                        )),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selImagen(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Selecionar una foto",
                          style: TextStyle(fontSize: 16),
                        )),
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.red),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Cancelar",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          );
        });
  }

  XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    String UserName = "";

    Text title = new Text(
      "Registrar Vehiculo",
      style: const TextStyle(
          fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    ImageAccessProvider imageAccessProvider =
        new ImageAccessProvider(context: context, state: widget.createState());

    actualizar() {
      setState(() {
        //imageAuto = imageAccessProvider.getImage();
      });
    }

    imageAccessProvider.setOntap(() {
      actualizar();
    });

    //imageAccessProvider.onTap = actualizar;

    CustomTextField txtNameOwner = new CustomTextField(hint: "Nombre Usuario");
    CustomTextField txtDni =
        new CustomTextField(hint: "Documento de identidad");
    CustomTextField txtNacinonalityOwner =
        new CustomTextField(hint: "Nacionalidad del dueño");
    CustomTextField txtPhone = new CustomTextField(hint: "Telefono");
    CustomTextField txtModelCar = new CustomTextField(hint: "Modelo");
    CustomTextField txtNumberPlate = new CustomTextField(hint: "N° de Placa");
    CustomTextField txtCarColor = new CustomTextField(hint: "Color");
    CustomTextField txtCapacity = new CustomTextField(hint: "Capacidad");

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        imageAccessProvider.openGalery().then((_) {
          setState(() {
            imageAuto = Image.file(imageAccessProvider.getImage());
          });
        });
      },
      buttonText: "Cancelar",
      buttonColor: Colors.white,
      buttonTextColor: Color.fromRGBO(255, 193, 7, 1),
      buttonBorderColor: Color.fromRGBO(255, 193, 7, 1),
      marginBotton: 0,
      marginLeft: 0,
      marginRight: 5,
      marginTop: 0,
    );

    CustomButton btnRegister = new CustomButton(
      onTap: () {
        setState(() {
          imageAuto = Image.file(imageAccessProvider.getImage());
        });
      },
      buttonText: "Registrar",
      buttonColor: Color.fromRGBO(255, 193, 7, 1),
      buttonTextColor: Colors.white,
      marginBotton: 0,
      marginLeft: 5,
      marginRight: 0,
      marginTop: 0,
    );

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSelectionDialog(context);
            opciones(context);
          },
          child: Icon(Icons.camera_alt),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
            ),
            imagen == null ? Center() : Image.file(imagen!),
            //_setImageView(),
            Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 35.0, right: 35.0),
                child: title),
            imageAuto,
            txtNameOwner,
            txtDni,
            txtNacinonalityOwner,
            txtPhone,
            txtModelCar,
            txtNumberPlate,
            txtCarColor,
            txtCapacity,
            Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: btnCancel),
                    Divider(),
                    Expanded(flex: 1, child: btnRegister)
                  ],
                )),
          ],
        )));
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = image;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = image;
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView() {
    if (imageFile != null) {
      File s = (imageFile) as File;
      return Image.file(
        s,
        width: 100,
        height: 100,
      );
    } else {
      return Text("Please select an image");
    }
  }
}
