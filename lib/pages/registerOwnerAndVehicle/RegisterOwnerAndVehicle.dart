import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/dialogs/CustomShowDialog.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextField.dart';
import 'package:taxi_segurito_app/pages/registerOwnerAndVehicle/RegisterOwnerAndVehicleFunctionality.dart';
import 'package:taxi_segurito_app/providers/imageAccessProvider.dart';

class RegisterOwnerAndVehicle extends StatefulWidget {
  RegisterOwnerAndVehicle({Key? key}) : super(key: key);

  @override
  _RegisterOwnerAndVehicleState createState() =>
      _RegisterOwnerAndVehicleState();
}

class _RegisterOwnerAndVehicleState extends State<RegisterOwnerAndVehicle> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
    RegisterOwnerAndVehicleFunctionality registerOwnerAndVehicleFunctionality;

    closeNavigator(BuildContext context) {
      Navigator.of(context).pop();
    }

    Text title = new Text(
      "Registrar Vehiculo",
      style: const TextStyle(
          fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.right,
    );

    Image imageAuto = new Image.asset(
      "lib/components/assets/images/auto.png",
      height: 150,
      width: 150,
    );
    File? imageFile;

    void _openGallery() async {
      var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = File(picture!.path);

        //imageAuto = Image.file(imageFile!);
      });
      //Navigator.of(context).pop();
    }

    Widget _setImageView() {
      if (imageFile != null) {
        return Image.file(imageFile!, width: 400, height: 400);
      } else {
        return Text("No Image Selected");
      }
    }

    ImageAccessProvider imageAccessProvider =
        new ImageAccessProvider(context: context);

    CustomTextField txtNameOwner = new CustomTextField(
      hint: "Nombres",
      isValidName: true,
    );
    CustomTextField txtDni =
        new CustomTextField(hint: "Documento de identidad");
    CustomTextField txtNacinonalityOwner = new CustomTextField(
      hint: "Nacionalidad del dueño",
      isValidName: true,
    );
    CustomTextField txtPhone = new CustomTextField(
      hint: "Telefono",
      isValidPhone: true,
    );
    CustomTextField txtModelCar = new CustomTextField(hint: "Modelo");
    CustomTextField txtNumberPlate = new CustomTextField(hint: "N° de Placa");
    CustomTextField txtCarColor = new CustomTextField(
      hint: "Color",
      isValidName: true,
    );
    CustomTextField txtCapacity = new CustomTextField(hint: "Capacidad");

    CustomDialogShow customDialogShow = new CustomDialogShow(
        buttonText: "Aceptar",
        ontap: () {
          closeNavigator(context);
        },
        context: context,
        buttonColor: colorMain,
        buttonColorText: Colors.white,
        titleShowDialog: "Registro Exitoso!");

    updateImage() {
      setState(() {
        imageAuto = Image.file(
          imageAccessProvider.getImage(),
          width: 100,
          height: 100,
        );
        Fluttertoast.showToast(
            msg: "Funcioona",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.yellow);
      });
    }

    CustomButtonWithLinearBorder btnCancel = new CustomButtonWithLinearBorder(
      onTap: () {
        _openGallery();
        /*
        imageAccessProvider.openGalery().then((_) {
          updateImage();
        });*/
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
        if (_formKey.currentState!.validate()) {
          registerOwnerAndVehicleFunctionality =
              new RegisterOwnerAndVehicleFunctionality(
                  context,
                  txtNameOwner.getValue(),
                  txtDni.getValue(),
                  txtNacinonalityOwner.getValue(),
                  txtPhone.getValue(),
                  txtModelCar.getValue(),
                  txtNumberPlate.getValue(),
                  txtCarColor.getValue(),
                  txtCapacity.getValue());
          registerOwnerAndVehicleFunctionality.onPressedbtnRegisterCar();
        }
        customDialogShow.getShowDialog();
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
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _setImageView(),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 35.0, right: 35.0),
                        child: title),
                    Container(
                        width: 250,
                        height: 125,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageAuto.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        )),
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
                ))));
  }
}
