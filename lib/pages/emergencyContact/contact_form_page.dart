import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_form_functionality.dart';

class FormContact_Page extends StatefulWidget 
{
  EmergencyContact _dataContact = new EmergencyContact.delete(0);

  FormContact_Page.insert();
  FormContact_Page.update(this._dataContact); //Aux para pasar datos de contacto

  _FormState createState() => _FormState(_dataContact);
  
}

class _FormState extends State<FormContact_Page> {

  EmergencyContact _dataContact = new EmergencyContact.delete(0);
  _FormState(this._dataContact); //Aux para pasar datos de contacto
 
  FormContact_Functionality formContact_functionality = new FormContact_Functionality();

  @override
  initState()
  {
    super.initState();
    loadData();
  }

  void loadData() async
  {
    await formContact_functionality.CheckSession();
    if(_dataContact.idEmergencyContact!=0)
    {
    setState(() {
      formContact_functionality.contactName_Controller.text = _dataContact.nameContact;
      formContact_functionality.contactNumber_Controller.text = _dataContact.number;
    });

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: (_dataContact.idEmergencyContact==0) ?Text("Registrar contacto"):Text("Editar contacto"),
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
                controller: formContact_functionality.contactName_Controller,
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
                controller: formContact_functionality.contactNumber_Controller,
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
                child: (_dataContact.idEmergencyContact==0) ?Text(
                  "Agregar contacto",
                  style: TextStyle(fontSize: 20)
                  ):Text(
                  "Editar contacto",
                  style: TextStyle(fontSize: 20)
                  )
                  ,
                onPressed: (){
                  if(_dataContact.idEmergencyContact==0) // Si estamos haciendo un INSERT
                  {
                    formContact_functionality.onPressedBtnAgregarContacto(context);
                  }
                  else                  // Si estamos haciendo un UPDATE
                  {
                    formContact_functionality.onPressedBtnEditarContact(context,_dataContact.idEmergencyContact);
                  }
                },
              ),

            ],
          ),
         ),
        ),


      );
  }
}
