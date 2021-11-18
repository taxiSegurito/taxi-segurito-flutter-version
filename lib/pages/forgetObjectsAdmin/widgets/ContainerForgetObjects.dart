import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/models/forgetObjectAdmin.dart';
import 'package:taxi_segurito_app/services/ForgetObjectsCrud.dart';

class ContainerForgetObjects extends StatefulWidget {
  dynamic dynamicObject;
  ContainerForgetObjects({Key? key, this.dynamicObject}) : super(key: key);

  @override
  _ContainerForgetObjectsState createState() => _ContainerForgetObjectsState();
}

class _ContainerForgetObjectsState extends State<ContainerForgetObjects> {
  @override
  Widget build(BuildContext context) {
    Color colorMain = Color.fromRGBO(255, 193, 7, 1);
     Container containerCredentialsColumnTwo = new Container(
        margin: EdgeInsets.only(left: 10),
        height: 60,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              child: Text(
                widget.dynamicObject.nameObject,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600),
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Row(
                children: [
                  SizedBox(
                    child: Text(
                      "Descripcion:",
                      style: TextStyle(
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                ],
              ),

              
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Row(
                children: [
                  Expanded(
                    child:
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                    widget.dynamicObject.description,
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w300),
                    ),)
                    ),],
              ),

              
              alignment: Alignment.centerLeft,
            ),
            
           
          ],
        )));  

         Container containerCredentialsColumnThree = new Container(
        height: 60,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Text(
                widget.dynamicObject.idForgetObject,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w400),
              ),
              alignment: Alignment.topRight,
            ),
          ],
        )));
        Container container = new Container(
        height: 110,
        color: Color.fromRGBO(246, 246, 246, 1),
        margin:
            new EdgeInsets.only(top: 5.0, bottom: 5.0, left: 00.0, right: 00.0),
        child: Material(
            child: InkWell(
                splashColor: colorMain,
                onTap: () {
                  //probar delete
                    showDialog(context: context,
                   builder: (context)=> AlertDialog(
                     content: Text("Estas seguro de Eliminar"),
                     actions: <Widget>[
                       FlatButton(
                         child: Text('No'),
                         onPressed: () {
                           Navigator.of(context).pop();
                         }
                       ),
                       FlatButton(
                         child: Text('Ok'),
                         onPressed: () {
                          //deleteLostObjects(); ELIMINO EL OBJETO
                          onPressedbtnDeleteObject();
                          Fluttertoast.showToast(
                          msg: "Objeto ${widget.dynamicObject.idForgetObject} Eliminado",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white);
                          Navigator.of(context).pop();
                         }
                       )
                     ]
                   ));
                },
                child: Container(
                  margin: new EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: containerCredentialsColumnTwo),
                      Expanded(flex: 0, child: containerCredentialsColumnThree)
                    ],
                  ),
                ))));

    return container;
  }
onPressedbtnDeleteObject(){
    ForgetObjectsList forgetObjectsList = new ForgetObjectsList
    (description: widget.dynamicObject.description, 
    idForgetObject: widget.dynamicObject.idForgetObject, 
    idVehicle: widget.dynamicObject.idVehicle,  
    nameObject: widget.dynamicObject.nameObject,  
    registerDate: widget.dynamicObject.registerDate,  
    status: widget.dynamicObject.status, 
    updateDate: widget.dynamicObject.updateDate, 
    idclientuser: widget.dynamicObject.idclientuser);
    deleteLostObjects(forgetObjectsList).then((value) {
        if (value) {
          return true;
        } else {
          return false;
        }
      });
  }
}


