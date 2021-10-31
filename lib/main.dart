import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistration.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/menu/adminMenu.dart';
import 'package:taxi_segurito_app/pages/ownerList/OwnerList.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';
import 'package:taxi_segurito_app/services/sessions_service.dart';
import 'package:taxi_segurito_app/pages/register/register_page_phone.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversListPage.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';
import 'package:taxi_segurito_app/pages/menu/ownerMenu.dart';
import 'models/Driver.dart';
import 'pages/companyList/CompanyList.dart';
import 'pages/menu/ownerMenu.dart';
import 'pages/scanDataDriver/travelCalification/driver_travel_calification_page.dart';
import 'pages/screenCompany/RegisterCompanyScreen.dart';
import 'pages/screenVehicle/RegisterVehicleScreen.dart';
import 'pages/screenVehicle/UpdateVehicleScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new HttpProvider();
  SessionsService sessions = SessionsService();

  bool idsession = await sessions.verificationSession("iduser");
  bool rolsession = await sessions.verificationSession("rol");
  bool googleSession = await sessions.verificationSession("emailGoogle");
  bool facebookSession = await sessions.verificationSession("emailFacebook");

  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
  );
  if (!idsession && !rolsession) {
    app = AppTaxiSegurito("firstScreen");
  } else {
    final rol = await sessions.getSessionValue("rol");
    final name = await sessions.getSessionValue("name");
    if (rol.toString() == "admin") {
      app = AppTaxiSegurito("adminMenu");
    }
    if (rol.toString() == "owner") {
      app = AppTaxiSegurito("ownerMenu");
    }
    if (rol.toString() == "client") {
      app = AppTaxiSegurito("QRpage");
    }
  }
  runApp(app);
}

class AppTaxiSegurito extends StatefulWidget {
  final String initialRoute;
  final String? sessionName;
  AppTaxiSegurito(this.initialRoute, {this.sessionName});
  @override
  _AppTaxiSeguritoState createState() =>
      _AppTaxiSeguritoState(initialRoute, sessionName: this.sessionName);
}

class _AppTaxiSeguritoState extends State<AppTaxiSegurito> {
  String routeInitial;
  String? sessionName;
  _AppTaxiSeguritoState(this.routeInitial, {this.sessionName});

  @override
  Widget build(BuildContext context) {
    String image =
        "iVBORw0KGgoAAAANSUhEUgAAAJYAAADICAQAAACgjNDuAAAAAmJLR0QA/4ePzL8AAAAJcEhZcwAACxMAAAsTAQCanBgAAAFqSURBVHja7dgxSxthHMfxX60x0NBCpywKFizSoTg2S8HBqVMnRxfxTfgm+g7a1U06OEiHDh2KUDq0dOgcMYiLcXDQhnM405LU5DY59PN5xnuG48txz58nAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO6kBzV7n5k8zXye5CK99HIp1iSzWclGOlm4jvUru9nLmS/6f61s5zDFyDrPTl5IM66R7ZyPpSrXpyzKM2or/RtTFSnyPo8E+udZfk5MVeQsb+py+tRBZ+qf6XHeZlas4Yn8Kg+n7nidebFKc1mq2NFOW6zhl9WsPCsbYpUGOa7Y0U9frNJlvlfs+J2uWENfczLlaZGPOTVfDTXzYcqc9aPyALhnlvJ5QqqTrMsz7mW+3JDqKJv1GEjr5nnepZvB31Cn2c9axbh6yzNOve4elrOahbTyJ8c5yDe3WQAAAAAAAAAAAAAAAAAjrgA9sX9RB69GsAAAAEl0RVh0Y29tbWVudABGaWxlIHNvdXJjZTogaHR0cDovL2NvbW1vbnMud2lraW1lZGlhLm9yZy93aWtpL0ZpbGU6RnVsbF9zdG9wLnBuZ/hCj5kAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTQtMTItMDRUMjM6MzY6MDQrMDA6MDDfLSfJAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE0LTEyLTA0VDIzOjM2OjA0KzAwOjAwrnCfdQAAAEZ0RVh0c29mdHdhcmUASW1hZ2VNYWdpY2sgNi42LjktNyAyMDE0LTAzLTA2IFExNiBodHRwOi8vd3d3LmltYWdlbWFnaWNrLm9yZ4HTs8MAAAAYdEVYdFRodW1iOjpEb2N1bWVudDo6UGFnZXMAMaf/uy8AAAAYdEVYdFRodW1iOjpJbWFnZTo6aGVpZ2h0ADY0MFHve2EAAAAXdEVYdFRodW1iOjpJbWFnZTo6V2lkdGgANDgwInKzjgAAABl0RVh0VGh1bWI6Ok1pbWV0eXBlAGltYWdlL3BuZz+yVk4AAAAXdEVYdFRodW1iOjpNVGltZQAxNDE3NzM2MTY0Cs916QAAABN0RVh0VGh1bWI6OlNpemUAMi4xM0tCQmpcHHIAAAAzdEVYdFRodW1iOjpVUkkAZmlsZTovLy90bXAvbG9jYWxjb3B5XzE3NTRiNzYyNmU2MC0xLnBuZ1oV86IAAAAASUVORK5CYII=";
    return MaterialApp(
      title: "Taxi Segurito",
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      initialRoute: routeInitial,
      routes: {
        'loginUser': (_) => UserLoginPage(),
        'scannerQr': (_) => QRPAGE(),
        'firstScreen': (_) => MainWindow(),
        'registerScreen': (_) => RegisterPage(),
        'registerCompany': (_) => RegisterCompanyScreen(),
        'registerOwner': (_) => RegisterOwner(),
        'registerVehicle': (_) => RegisterVehicleScreen(),
        'driverRegistration': (_) => DriverRegistration(),
        'QRpage': (_) => QRPAGE(),
        'driverList': (_) => DriversListPage(),
        'ownerMenu': (_) => OwnerMenu(name: this.sessionName),
        'userList': (_) => OnwerList(),
        'companyList': (_) => CompanyList(),
        'adminMenu': (_) => AdminMenu(name: this.sessionName),
        'reportCar': (_) => DriverTravelCalificationPage(
              Driver("Rogelio Castro", "12345678", "75554554"),
              Vehicle(
                  idVehicle: "1",
                  capacity: "1 kilo",
                  color: "rojo con franjas verdes",
                  model: "Lamborginy",
                  pleik: "sdasd",
                  photo: image,
                  status: "1",
                  owner_idOwner: "1",
                  report_car_idReports: "sdasd"),
            ),
        'updateVehicleScreen': (BuildContext contextss) => UpdateVehicleScreen(
              Vehicle(
                  idVehicle: "1",
                  capacity: "1 kilo",
                  color: "rojo con franjas verdes",
                  model: "Lamborginy",
                  pleik: "sdasd",
                  photo: image,
                  status: "1",
                  owner_idOwner: "1",
                  report_car_idReports: "sdasd"),
            ),
      },
    );
  }
}
