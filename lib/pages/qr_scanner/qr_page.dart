import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:taxi_segurito_app/pages/scanDataDriver/scanDataDriver.dart';
import '../../components/sidemenu/side_menu.dart';


class QRPAGE extends StatefulWidget {
  @override
  _QrBarcodeState createState() => new _QrBarcodeState();
}

class _QrBarcodeState extends State<QRPAGE> {
  bool _camState = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      // EN ESTA PARTE ESTA EL BOTON DEL MENU
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, //Cambie el color del appBar
        title: Text('Taxi Segurito'),
      ),
      // DRAWER
      //Llamar SideMenu()
      drawer: SideMenu(),
      body: Stack(children: <Widget>[
        _scanner(context),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  _qrCallback(String code) {
    setState(() {
      _camState = false;
    });
    Timer(
        Duration(milliseconds: 1500),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ScanDataDriver(code))));
  }

  Widget _scanner(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              child: _camState
                  ? QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) {
                        _qrCallback(code!);
                      },
                    )
                  : Center(
                      child: SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red[100],
                            strokeWidth: 10.0,
                          )),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(bottom: 8),
            child: Center(
              child: Text(
                'Ubique el codigo QR frente a la cámara',
                style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
