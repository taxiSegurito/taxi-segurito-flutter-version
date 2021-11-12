import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_segurito_app/services/report_car_service.dart';
import 'package:taxi_segurito_app/components/stars/stars.dart';

class Function_Page extends StatefulWidget {
  const Function_Page({Key? key}) : super(key: key);

  @override
  _Function_State createState() => _Function_State();
}

class _Function_State extends State<Function_Page> {
  var idVehicle = '1';
  double averageStars = 0.0;
  Future LoadData_Function() async
  {
    var result = await getAverageCualification(idVehicle);
    if(result != null)
    {
      averageStars = double.parse(result);
      averageStars.toStringAsFixed(2);
    }
  }
  Widget build(BuildContext context) {
    return FutureBuilder(future: LoadData_Function(),builder: (context,AsyncSnapshot snapshot) {return _insertScaffold();});
  }

 // 1 UI Method: load all widgets
  Scaffold _insertScaffold(){return Scaffold(
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: insertStars(averageStars, 35),
            ),
          )
        ),
      );
  }

}