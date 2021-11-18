import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/owner.dart';

class OwnerData extends StatelessWidget {
  Owner owner;
  OwnerData(this.owner);

  @override
  Widget build(BuildContext context) {
    Image imagedefault = Image.asset("assets/images/user_default.png");
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
                      fontSize: sizeFontSubtitle,
                    ),
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
                    owner.fullName,
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
                        owner.ci,
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
                        owner.cellPhone,
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
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      child: Text(
                        owner.email,
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
                        'Dirección:',
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
                        owner.address,
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
                        'Vehiculo(s):',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 15, bottom: 20),
                      child: Text(
                        '',
                        textAlign: TextAlign.left,
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
