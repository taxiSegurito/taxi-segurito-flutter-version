import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/models/Vehicle.dart';
import 'package:taxi_segurito_app/models/providers/HttpProvider.dart';
import 'package:taxi_segurito_app/models/sesions/sesion.dart';
import 'package:taxi_segurito_app/pages/historyReview/HistoryReview.dart';
import 'package:taxi_segurito_app/pages/mainWindow/MainWindow.dart';
import 'package:taxi_segurito_app/pages/login/login_page.dart';
import 'package:taxi_segurito_app/pages/menu/adminMenu.dart';
import 'package:taxi_segurito_app/pages/ownerList/OwnerList.dart';
import 'package:taxi_segurito_app/pages/qr_scanner/qr_page.dart';
import 'package:taxi_segurito_app/pages/register/register_page_phone.dart';
import 'package:taxi_segurito_app/pages/driverRegistration/DriverRegistration.dart';
import 'package:taxi_segurito_app/pages/driversList/DriversList.dart';
import 'package:taxi_segurito_app/pages/registerOwner/RegisterOwner.dart';
import 'models/Company.dart';
import 'models/Driver.dart';
import 'pages/companyList/CompanyList.dart';
import 'pages/menu/ownerMenu.dart';
import 'pages/scanDataDriver/travelCalification/driver_travel_calification_page.dart';
import 'pages/screenCompany/RegisterCompanyScreen.dart';
import 'pages/screenCompany/UpdateCompanyScreen.dart';
import 'pages/screenVehicle/RegisterVehicleScreen.dart';
import 'pages/screenVehicle/UpdateVehicleScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new HttpProvider();
  Sessions sessions = Sessions();

  bool idsession = await sessions.verificationSession("iduser");
  bool rolsession = await sessions.verificationSession("rol");
  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
  );
  if (!idsession && !rolsession) {
    app = AppTaxiSegurito("historyReview");
  } else {
    var rol = await sessions.getSessionValue("rol");
    if (rol.toString() == "Administrador") {
      app = AppTaxiSegurito("registerOwner");
    }
    if (rol.toString() == "Dueño") {
      app = AppTaxiSegurito("driverList");
    }
    if (rol.toString() == "Cliente") {
      app = AppTaxiSegurito("QRpage");
    }
  }
  runApp(app);
}

class AppTaxiSegurito extends StatefulWidget {
  final String initialRoute;
  AppTaxiSegurito(this.initialRoute);
  @override
  _AppTaxiSeguritoState createState() => _AppTaxiSeguritoState(initialRoute);
}

class _AppTaxiSeguritoState extends State<AppTaxiSegurito> {
  String routeInitial;
  _AppTaxiSeguritoState(this.routeInitial);
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
        'loginUser': (BuildContext contexUserLogin) => UserLoginPage(),
        'firstScreen': (BuildContext contextFirstScreen) => MainWindow(),
        'registerScreen': (BuildContext contextFirstScreen) => RegisterPage(),
        'registerCompany': (BuildContext contextRegisterCompany) =>
            RegisterCompanyScreen(),
        'updateCompany': (BuildContext buildContext) => UpdateCompanyScreen(
            Company(
                idCompany: "1", companyName: "6 de Agosto", nit: "12345678")),
        'registerOwner': (BuildContext contextRegisterOwner) => RegisterOwner(),
        'registerVehicle': (BuildContext contextRegisterVehicle) =>
            RegisterVehicleScreen(),
        'driverRegistration': (BuildContext contextRegistration) =>
            DriverRegistration(),
        'driverList': (BuildContext contextDriveList) => DriversList(),
        'QRpage': (BuildContext contextDriveList) => QRPAGE(),
        'userList': (BuildContext contextUserList) => OnwerList(),
        'companyList': (BuildContext contextUserList) => CompanyList(),
        'registerVehicleScreen': (BuildContext contextss) =>
            RegisterVehicleScreen(),
        'historyReview': (_) => HistoryReview(),
        'ownerMenu': (_) => OwnerMenu(),
        'adminMenu': (_) => AdminMenu(),
        'reportCar': (_) => DriverTravelCalificationPage(
              Driver(name: "Rogelio Castro", dni: "12345678", phone: "5554554"),
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
