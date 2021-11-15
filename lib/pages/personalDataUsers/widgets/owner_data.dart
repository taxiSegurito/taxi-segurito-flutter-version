import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/clasesDataDriverUsers/DataDriverSelect.dart';
import 'package:taxi_segurito_app/providers/ImageFromBase64Provider.dart';

class OwnerData extends StatelessWidget {
  DataDriverSelect dataDriverSelect;
  OwnerData(this.dataDriverSelect);

  @override
  Widget build(BuildContext context) {
    Image imagedefault =
        new Image.memory(bytesFromBase64String(dataDriverSelect.photo));
    double sizeFontSubtitle = 17;
    double width = MediaQuery.of(context).size.width / 3.5;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: width,
            height: width,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: imagedefault.image, fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Dueño',
                    style: TextStyle(
                        color: Color.fromRGBO(93, 93, 93, 1),
                        fontFamily: 'Raleway',
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    dataDriverSelect.fullName,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 26,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          //container que almacena una tabla para mostrar los datos
          Container(
            child: Table(
              border: TableBorder(
                  top: BorderSide(), horizontalInside: BorderSide()),
              children: [
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      child: Text(
                        'Carnet de Identidad:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        dataDriverSelect.ci,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      child: Text(
                        'Licencia:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        dataDriverSelect.license,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      child: Text(
                        'Celular:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        dataDriverSelect.cellphone,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      child: Text(
                        'Correo:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        dataDriverSelect.email,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      child: Text(
                        'Nacionalidad:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        dataDriverSelect.nacionalidad,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 15, bottom: 20),
                      child: Text(
                        'Vehiculo(s) Asignados:',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 15),
                      child: Text(
                        'Boliviana/o',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 0,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
