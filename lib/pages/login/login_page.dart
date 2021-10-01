import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/pages/login/recoveryPass_page.dart';
class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Taxi Segurito"),
          backgroundColor: Colors.white,
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            //icon: Icon(Icons.account_box_outlined),
                            hintText: "Ingrese su celular o e-mail"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 38,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1)
                          ]),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          // icon: Icon(Icons.lock),
                          hintText: "Ingrese su Contaseña",
                        ),
                      ),
                    ),

                    //

                    // btn Ingresar
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow.shade600),
                                ),
                                onPressed: () {},
                                child:
                                    Text("             Ingresar            "))
                          ],
                        ),
                      ),
                    ),

                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecoveryPass()),);
                                },
                                child: Text("Olvidaste tu contraseña?",
                                    style: TextStyle(color: Colors.blueAccent)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
