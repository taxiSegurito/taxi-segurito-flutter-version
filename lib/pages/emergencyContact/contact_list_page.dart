import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_form_page.dart';
import 'package:taxi_segurito_app/pages/emergencyContact/contact_list_functionality.dart';


class ListContact_Page extends StatefulWidget
{
  @override
  _ListContactState createState() => new _ListContactState();
}

class _ListContactState extends State<ListContact_Page> {
  
  ListContact_Functionality listContact_functionality = new ListContact_Functionality();
  @override
  initState()
  {
    super.initState();
    /*
    setState(() {
      listContact_functionality.loadData();
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: listContact_functionality.loadData(),builder: (context, snapshot) {return _loadWidgets();});    
  }

  // UI Method 1: Contiene toda la interfaz, se recarga una vez se obtengan los datos, si no hay datos, mostrará "No tiene contactos de emergencia"
  Widget _loadWidgets(){
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
        floatingActionButton: (listContact_functionality.isSession == true) ? _insertFloatingButton():null,

        body: (listContact_functionality.contacts.isNotEmpty) ? ListView(
          children: _insertItem()  //Si hay contactos
        ):
        //Si no hay contactos
        Center(
          child: Padding(padding : EdgeInsets.all(20),
                         child: Text("No tiene contactos de emergencia registrados.",textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: "Raleway",fontSize: 25,color: Colors.grey,),)),
        ),
        
    );
  }
  // UI Method 2: Metodo para generar un widget por cada contacto con sus datos
  List<Widget> _insertItem(){

    List<Widget> temporal = [];

    for(var contact in listContact_functionality.contacts) {
      Widget item = Padding(
                    padding: EdgeInsets.all(10),
                    child:Container(
                      padding:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.person_outline,
                              size: 60,
                              color: Colors.grey,
                              )
                            ),
                            Column(
                              children: [
                              Container(
                                width: (MediaQuery.of(context).size.width / 10)*5,
                                height: 35,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  contact.nameContact,
                                  style: TextStyle(fontFamily: "Raleway",fontSize: 22,color: Colors.blueGrey),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width / 10)*5,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "+591 "+contact.number,
                                  style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.grey),
                                )
                              ),
                              ],
                            ),
                            //Edit Button
                            Container(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FormContact_Page.update(contact)),);
                                },
                              child: Icon(
                                Icons.edit,
                                size: 40,
                                color: Colors.blueGrey,
                                )
                              )
                            ),
                            //
                            //Delete Button
                            Container(
                            width: 40,
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: (){_showConfirmDelete(contact.idEmergencyContact);},
                              child: Icon(
                                Icons.delete,
                                size: 40,
                                color: Colors.red,
                                )
                              )
                            ),
                            

                        ],
                      ) 

                    ),);

      temporal.add(item);
    }
    return temporal;
  }

// UI METHODS

 /// UI Method 1: Genera floatingButtom para agregar contactos.
  Widget _insertFloatingButton(){
    return FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FormContact_Page.insert()),);
            },
          child: Icon(Icons.add),
        );
  }

  /// UI Method 2: Muestra un mensaje de confirmacion de eliminacion.
  Future<void> _showConfirmDelete(idEmergencyContact) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('¿Borrar contacto de emergencia?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Borrar'),
            onPressed: () {
                listContact_functionality.DeleteContact_Function(idEmergencyContact,context);
                setState(() {
                Navigator.of(context).pop();
              });
            },
          ),
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }

}
