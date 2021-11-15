import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_segurito_app/pages/client_user_edit/editUser_functionality.dart';

class EditUser_page extends StatefulWidget {
  const EditUser_page({Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser_page> {

  EditUserFunctionality editUserFunctionality = new EditUserFunctionality();

  Image imgUserPhoto = new Image.network('https://www.hispano-irish.com/wp-content/uploads/2020/05/PngItem_1300253.png',
  height: 150,
  width: 150);

Widget build(BuildContext context) {
      return FutureBuilder(future: editUserFunctionality.loadData(),builder: (context,AsyncSnapshot snapshot) { return _loadWidgets();});   
}
Widget _loadWidgets() {
  return Scaffold(
        appBar: AppBar(
          title: Text("Editar Datos"),
          backgroundColor: const Color(0xFFF2D43D),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ));
            },
          ),
        ),
        body: SingleChildScrollView (child: Container(
          child: Column(
            children: [
       Container(
        height: 200,
        child: Expanded(
            child: Container(
              margin: new EdgeInsets.only(top: 20, left: 57, right: 57),
              child: new Column(
                  children: [imgUserPhoto]
                  ),
            ),
          ),
        ),
        Container(width:20,height: 15),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 130),
                child: Column(
                  children: [
                    //Nombre Completo
                  Row(
                      children: [
                   Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Nombre Completo:    ",
                          style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 6,height: 10,),
                    Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: editUserFunctionality.nombreCompletoController,
                        decoration: InputDecoration(
                            hintText: "Nombre Completo"),
                      ),
                    ),
                    
                      ],
                    ),
                  //Espaciado
                    Container(width:20,height: 15),
                  //Cellphone
                   Row(
                      children: [
                   Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Celular:                        ",
                          style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 6,height: 10,),
                    Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: editUserFunctionality.cellphoneController,
                        decoration: InputDecoration(
                            hintText: "Numero de celular"),
                      ),
                    ),
                    
                      ],
                    ),
                    // btn Editar cuenta
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow.shade600),
                                ),
                                onPressed: () {editUserFunctionality.onPressedBtnSaveChanges(context);},
                                child:
                                    Text("            Guardar Cambios            "))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
         )
        )
      );
  }

}
  

