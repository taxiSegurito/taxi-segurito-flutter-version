import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_segurito_app/models/report_car.dart';
import 'package:taxi_segurito_app/services/server.dart';

Future<bool> insertReportCar(ReportCar reportCar) async {
  print("${reportCar.calification} desde endpoint");
  try {
    var path = Server.url + "CarReport/reportCar_controller.php";
    final response = await http.post(Uri.parse(path),
        body: jsonEncode(
          {
            "calification": reportCar.calification,
            "coments": reportCar.comment,
            "clientUserId": reportCar.idClientuser,
            "vehicleId": reportCar.idVehicule
          },
        ));
    String result = json.decode(response.body);

    print(result);

    if (result == "success") {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  } catch (exception) {
    print(exception);
    return Future<bool>.value(false);
  }
}
