import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_segurito_app/bloc/services/sms_twilio.dart';
import 'package:taxi_segurito_app/components/buttons/CustomButton.dart';
import 'package:taxi_segurito_app/models/client_user.dart';
import 'package:taxi_segurito_app/pages/register/register_info_functionality.dart';
import 'package:taxi_segurito_app/pages/register/register_page_info.dart';
import 'package:taxi_segurito_app/services/server.dart';
import 'package:taxi_segurito_app/services/sign_up_service.dart';

class RegisterPage extends StatefulWidget {
  Clientuser? user;
  RegisterPage();
  RegisterPage.GoogleOrFacebook(Clientuser clientuser) {
    user = clientuser;
  }
  @override
  _RegisterPageState createState() => new _RegisterPageState(user: user);
}

class _RegisterPageState extends State<RegisterPage> {
  Clientuser? user;
  _RegisterPageState({this.user});

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

  void _verifySIgnUpType() async {
    if (user != null) {
      user!.cellphone = number.text;
      log("Es desde btn google o facebook");
      log(user!.email);

      bool result = false;
      if (user!.signUpType == Server.SignUpType["FACEBOOK"]) {
        result = await SignUpService().registerClientThroughFacebook(user!);
      } else if (user!.signUpType == Server.SignUpType["GOOGLE"]) {
        result = await SignUpService().registerClientThroughGoogle(user!);
      }

      if (result) {
        Navigator.pushReplacementNamed(
          context,
          'scannerQr',
          arguments: user!.fullName,
        );
      }
    } else {
      _start = 0;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RegisterData(number.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    RegisterFunctionality registerFunctionality =
        new RegisterFunctionality.cont(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
            "assets/images/logoPrincipal.png",
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
                                          Sms sms = new Sms();
                                          code = registerFunctionality
                                              .generateCode();
                                          _changed(true, "code");
                                          startTimer();
                                          _changed(false, "phone");
                                          // sms.sendSms(
                                          //     "+591" + number.text,
                                          //     "El codigo de verificacion es: " +
                                          //         code);
                                        }
                                      },
                                      buttonText: "VERIFICAR",
                                      buttonColor: Colors.amberAccent,
                                      buttonTextColor: Colors.white,
                                    )
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
                                      _verifySIgnUpType();
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
            ),
          )
        ],
      ),
    );
  }
}
