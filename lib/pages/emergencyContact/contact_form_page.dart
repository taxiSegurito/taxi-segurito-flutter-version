import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/emergencyContact.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_form_functionality.dart';

class ContactFormPage extends StatefulWidget {
  EmergencyContact _dataContact = new EmergencyContact.delete(0);

  ContactFormPage.insert();
  ContactFormPage.update(this._dataContact); //Aux para pasar datos de contacto

  _FormState createState() => _FormState(_dataContact);
}

class _FormState extends State<ContactFormPage> {
  EmergencyContact _dataContact = new EmergencyContact.delete(0);
  _FormState(this._dataContact); //Aux para pasar datos de contacto

  ContactFormFunctionality functionality = new ContactFormFunctionality();

  @override
  initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await functionality.checkSession();
    if (_dataContact.idEmergencyContact != 0) {
      setState(() {
        functionality.contactNameController.text = _dataContact.nameContact;
        functionality.contactNumberController.text = _dataContact.number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (_dataContact.idEmergencyContact == 0)
            ? Text("Registrar contacto")
            : Text("Editar contacto"),
        backgroundColor: Color.fromRGBO(242, 213, 60, 1),
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              //Inputs
              TextField(
                controller: functionality.contactNameController,
                decoration: InputDecoration(
                  hintText: "Nombre",
                  icon: const Icon(
                    Icons.person_outline,
                    size: 35,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: functionality.contactNumberController,
                  decoration: InputDecoration(
                    hintText: "Número",
                    icon: const Icon(
                      Icons.phone,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              ElevatedButton(
                child: (_dataContact.idEmergencyContact == 0)
                    ? Text("Agregar contacto", style: TextStyle(fontSize: 20))
                    : Text("Editar contacto", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  if (_dataContact.idEmergencyContact ==
                      0) // Si estamos haciendo un INSERT
                  {
                    functionality.onPressedBtnAgregarContacto(context);
                  } else // Si estamos haciendo un UPDATE
                  {
                    functionality.onPressedBtnEditarContact(
                        context, _dataContact.idEmergencyContact);
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
