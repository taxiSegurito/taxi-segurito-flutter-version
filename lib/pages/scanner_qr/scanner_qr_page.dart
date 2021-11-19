import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:taxi_segurito_app/pages/scanner_driver_vehicle_info/driver_info_scanner.dart';
import '../../components/sidemenu/side_menu.dart';

class ScannerQrPage extends StatefulWidget {
  String? name;
  ScannerQrPage({this.name});
  @override
  _ScannerQrPageState createState() => new _ScannerQrPageState();
}

class _ScannerQrPageState extends State<ScannerQrPage> {
  bool _camState = false;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      widget.name = ModalRoute.of(context)!.settings.arguments as String;
    }

    return new Scaffold(
      backgroundColor: Colors.transparent,
      // EN ESTA PARTE ESTA EL BOTON DEL MENU
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, //Cambie el color del appBar
        title: Text('Taxi Segurito'),
        foregroundColor: Colors.white,
      ),
      drawer: SideMenu(username: widget.name),
      body: Stack(
        children: <Widget>[
          _scanner(context),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _camState = true;
    });
  }

  _onQrScanned(String code) {
    setState(() {
      _camState = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScannedQrInfoPage(code),
      ),
    );
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
                        _onQrScanned(code!);
                      },
                    )
                  : Center(
                      child: SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red[100],
                          strokeWidth: 10.0,
                        ),
                      ),
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
