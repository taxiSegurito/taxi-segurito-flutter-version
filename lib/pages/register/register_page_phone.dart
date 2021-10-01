import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/pages/register/register_page_info.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

String _generateCode() {
  String code = "";
  var rng = new Random();
  for (var i = 0; i < 6; i++) {
    code = code + rng.nextInt(9).toString();
  }
  return code;
}

class _RegisterPageState extends State<RegisterPage> {
  bool visibilitycode = false;
  bool visibilityphone = true;
  TextEditingController number = TextEditingController();
  late Timer _timer;
  int _start = 180;
  String code = "";

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "code") {
        visibilitycode = visibility;
      }
      if (field == "phone") {
        visibilityphone = visibility;
      }
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _changed(false, "code");
          _start = 180;
          _changed(true, "phone");
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registro de usuarios"),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: Colors.black));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "lib/components/assets/images/logoPrincipal.png",
            height: 150,
            width: 150,
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: new EdgeInsets.only(top: 20.0, left: 57, right: 57),
                child: new Column(
                  children: [
                    visibilityphone
                        ? new Container(
                            child: Column(
                              children: [
                                Text(
                                  "Ingrese su numero de telefono ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: 'Raleway'),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.amber,
                                              ),
                                            ),
                                            hintText: '71234568',
                                            labelText: 'Telefono',
                                            fillColor: Colors.amber,
                                            labelStyle:
                                                TextStyle(color: Colors.black)),
                                        style: TextStyle(color: Colors.black),
                                        controller: number,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      new CustomButton(
                                          onTap: () {
                                            if (!visibilitycode) {
                                              code = _generateCode();
                                              _changed(true, "code");
                                              startTimer();
                                              _changed(false, "phone");
                                            }
                                          },
                                          buttonText: "VERIFICAR",
                                          buttonColor: Colors.amberAccent,
                                          buttonTextColor: Colors.white)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : new Container(),
                    SizedBox(
                      height: 40,
                    ),
                    visibilitycode
                        ? new Container(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Ingrese el codigo de verificacion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                PinCodeTextField(
                                  appContext: context,
                                  length: 6,
                                  onChanged: (value) {
                                    if (code != "") {
                                      if (value == code) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterData(number.text)));
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Tiempo restante $code"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("$_start Seg")
                              ],
                            ),
                          )
                        : new Container()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
