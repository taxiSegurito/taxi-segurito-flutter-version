import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_form_page.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_list_functionality.dart';

class ListContact_Page extends StatefulWidget {
  @override
  _ListContactState createState() => new _ListContactState();
}

class _ListContactState extends State<ListContact_Page> {
  ListContactFunctionality functionality = new ListContactFunctionality();
  List<dynamic> contacts = [];
  var aux; //Para esperar la respuesta del futureBuilder
  var isSession;

  Future loadData() async {
    isSession = await functionality.CheckID(); //Revisa si hay sesion,
    print("0.5: " + isSession.toString());
    if (isSession) {
      List<dynamic> dataSet1 = await functionality.SelectContactData();
      print("2: " + dataSet1.toString());
      if (dataSet1.toString() == "NoResponse") {
        functionality.showCustomToast(
            "Error al conectar con la base de datos.", Colors.red);
        return [];
      } else {
        contacts = dataSet1;
        return dataSet1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Para poder obtener los datos antes de presentar la interfaz, utilizaremos un FutureBuilder
    return FutureBuilder(
        future: aux = loadData(),
        builder: (_, AsyncSnapshot snapshot) {
          return _loadWidgets();
        });
  }

  // UI Function 1: Carga la interfaz una vez obtengan los datos, si no hay datos, mostrará "No tiene contactos de emergencia"
  Widget _loadWidgets() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos de Emergencia"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
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
      //FloatingButton
      floatingActionButton:
          (isSession == true) ? _insertFloatingButton() : null,

      body: (contacts.toString() != "[]")
          ? ListView(children: _insertItem() //Si hay contactos
              )
          :
          //Si no hay contactos
          Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "No tiene contactos de emergencia registrados.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 25,
                      color: Colors.grey,
                    ),
                  )),
            ),
    );
  }

  // UI Function 2: Metodo para generar un widget por cada contacto con sus datos
  List<Widget> _insertItem() {
    List<Widget> temporal = [];

    for (var contact in contacts) {
      Widget item = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, color: Colors.black12)
                ]),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Icon(
                      Icons.person_outline,
                      size: 60,
                      color: Colors.grey,
                    )),
                Column(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 5) * 3,
                      height: 40,
                      alignment: Alignment.topLeft,
                      child: Text(
                        contact['nameContact'],
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 24,
                            color: Colors.blueGrey),
                      ),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width / 5) * 3,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "+591 " + contact['number'],
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.grey),
                        )),
                  ],
                ),
              ],
            )),
      );

      temporal.add(item);
    }
    return temporal;
  }

// UI Function 3: Genera floatingButtom para agregar contactos, si no hay sesion, no se activa el metodo
  Widget _insertFloatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FormContact_Page()),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
