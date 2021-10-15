import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/formContact_functionality.dart';
class FormContact_Page extends StatefulWidget {
  _FormState createState() => _FormState();
}

class _FormState extends State<FormContact_Page> {
  FormContact_Functionality formContact_Functionality = new FormContact_Functionality();
  var aux; //Para esperar la respuesta del futureBuilder
  var isSession;
  @override
  void initState()
  {
    LoadData_Function();
  }

  void LoadData_Function() async
  {
    isSession = await formContact_Functionality.CheckID(); //Revisa si hay sesion,
    print("isSession: "+isSession.toString());
    if(isSession)
    { /*
        List<dynamic> data = await formContact_Functionality.GetContactData();
        print("2: "+data.toString());
        if(data.toString()=="NoResponse")
        {
          formContact_Functionality.ShowCustomToast("Error al conectar con la base de datos.", Colors.red);
          return [];
        }
        else{
          //contacts = dataSet1;
          return data;
        } */
    }
  }
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
                controller: formContact_Functionality.contactName_Controller,
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
                controller: formContact_Functionality.contactNumber_Controller,
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
                onPressed: (){formContact_Functionality.InsertContact_Function(context);}
              ),

            ],
          ),
         ),
        ),


      );
  }
}