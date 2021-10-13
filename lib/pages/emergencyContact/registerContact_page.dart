import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/registerContact_functionality.dart';
class RegisterContact_Page extends StatefulWidget {
 // RegisterContact_Page(Key key) : super(key: key);

  //static final nameP = "formulario";

  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterContact_Page> {
  RegisterContact_Functionality registerContact_Functionality = new RegisterContact_Functionality();
  //final id = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Registrar contacto"),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
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
      body: SingleChildScrollView(
        child : Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
        child:Column(
            children: <Widget>[
              //Inputs
              TextField(
                controller: registerContact_Functionality.contactName_Controller,
                decoration: InputDecoration(
                  hintText: "  Apodo del contacto",
                  icon: const Icon(
                            Icons.person_outline,
                            size: 35,
                          ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child :
              TextField(
                controller: registerContact_Functionality.contactNumber_Controller,
                decoration: InputDecoration(
                  hintText: "  Numero del contacto",
                  icon: const Icon(
                            Icons.phone,
                            size: 35,
                          ),
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              ElevatedButton(
                child: Text(
                  "Agregar contacto",
                  style: TextStyle(fontSize: 20)
                  ),
                onPressed: (){registerContact_Functionality.InsertContact_Function(context);}
              ),

            ],
          ),
         ),
        ),


      );
  }
}