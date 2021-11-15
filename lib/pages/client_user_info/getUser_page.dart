import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/client_user_info/getUser_functionality.dart';


class GetUser_page extends StatefulWidget {
  const GetUser_page({Key? key}) : super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser_page> {

  GetUserFunctionality getUserFunctionality = new GetUserFunctionality();

  Image imgUserPhoto = new Image.network('https://www.hispano-irish.com/wp-content/uploads/2020/05/PngItem_1300253.png',
  height: 150,
  width: 150);

Widget build(BuildContext context) {
    return FutureBuilder(future: getUserFunctionality.loadData(),builder: (context,AsyncSnapshot snapshot) { return _loadWidgets();});   
}
  // UI Function 1: Carga la interfaz una vez obtengan los datos, si no hay datos, mostrará el de invitado
  Widget _loadWidgets(){
    return Scaffold(
        appBar: AppBar(
          title: Text("Datos"),
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
        body: Container(
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
        
        Positioned(
        child: Text('Usuario', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(93, 93, 93, 1),
        fontFamily: 'Raleway',
        fontSize: 13,
        fontWeight: FontWeight.bold,
             ),
          ),
        ),
        Container(width:20,height: 15),
        Positioned(
          child: Text(getUserFunctionality.nombreCompletoController.text, textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 140,left: 20,right: 20),
                child: Column(
                  children: [

                //Separator
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                ),
                  //Cellphone
                   Row(
                      children: [
                   Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Celular:                        ",
                          style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: 35,
                      child: Text(getUserFunctionality.nationality+" "+getUserFunctionality.cellphoneController.text, textAlign: TextAlign.right, style: TextStyle(
                        color: Color.fromRGBO(93, 93, 93, 1),
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1
                      ),)
                    ),
                      ],
                    ),
                    //Separador
                 Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                ),
                  //Email
                   Row(
                      children: [
                   Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Correo:",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 35,
                      child: Text(getUserFunctionality.emailController.text, textAlign: TextAlign.right, style: TextStyle(
                        color: Color.fromRGBO(93, 93, 93, 1),
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1
                      ),)
                    ),
                    
                      ],
                    ),
                    //Separador
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                ),
                    // btn Editar cuenta
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: (getUserFunctionality.isSession) ? ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                                 Colors.yellow.shade600),
                                ),
                        onPressed: () {
                              getUserFunctionality.onPressedBtnEditUser(context);
                        },
                        child: Text("            Editar cuenta            "),
                      ): null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      );
  }
}
