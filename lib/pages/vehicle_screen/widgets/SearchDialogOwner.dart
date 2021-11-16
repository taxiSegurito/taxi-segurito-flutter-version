import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButtonWithLinearBorder.dart';
import 'package:taxi_segurito_app/components/inputs/CustomTextFieldSearch.dart';
import 'package:taxi_segurito_app/models/owner.dart';

class SearchDialogOwner {
  final void Function(Owner) callback;
  final void Function(String) callbackValueSearch;
  CustomButtonWithLinearBorder? btnCancel;
  BuildContext context;
  String titleShowDialog;

  VoidCallback ontapButtonCancel;
  String buttonCancelText;
  Color buttonCancelColor;
  Color buttonCancelColorBorder;
  Color buttonCancelColotText;

  static const Color colorMain = Color.fromRGBO(255, 193, 7, 1);
  static const Color colorMainText = Colors.white;
  SearchDialogOwner(
      {required this.context,
      required this.titleShowDialog,
      required this.ontapButtonCancel,
      required this.buttonCancelText,
      required this.callback,
      required this.callbackValueSearch,
      this.buttonCancelColor = colorMainText,
      this.buttonCancelColotText = colorMain,
      this.buttonCancelColorBorder = colorMain});

  closeDialog() {
    Navigator.of(context).pop();
  }

  showAlertDialog() {
    // CustomListViewCardSimpleOwner listView = new CustomListViewCardSimpleOwner(
    //   ontap: () {},
    //   callback: (Owner owner) {
    //     callback(owner);
    //   },
    // );

    btnCancel = new CustomButtonWithLinearBorder(
      onTap: ontapButtonCancel,
      buttonText: buttonCancelText,
      buttonColor: buttonCancelColor,
      buttonTextColor: buttonCancelColotText,
      buttonBorderColor: colorMain,
    );
    CustomTextFieldSearch txtSearch = new CustomTextFieldSearch(
      marginLeft: 50,
      marginRight: 50,
      hint: "Buscar",
      ontap: () {},
      callbackValueSearch: (String value) {
        callbackValueSearch(value);
        // listView.updateListView();
      },
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
            title: Text(
              titleShowDialog,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  txtSearch,
                  // Container(child: listView),
                  btnCancel!,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
