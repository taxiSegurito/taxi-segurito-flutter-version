import 'package:flutter/material.dart';
import 'package:taxi_segurito_app/bloc/services/sms/sms_twilio.dart';
import 'package:taxi_segurito_app/models/emergencycontact.dart';
import 'package:taxi_segurito_app/pages/contacList/location_functionality.dart';
import 'package:geolocator/geolocator.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  LocationFunctionality locationFunctionality = new LocationFunctionality();
  late Future<List<EmergencyContact>> emergycontact;
  late Position currentPosition;

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    emergycontact = locationFunctionality.listContac("1");
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Seleccione el contacto"),
        ),
        body: Center(
            child: FutureBuilder<List<EmergencyContact>>(
          future: emergycontact,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EmergencyContact>? data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      _getCurrentLocation();
                      print(currentPosition.latitude);
                      print(currentPosition.longitude);
                      this._enviarUbicacion(context, data[index]);
                    },
                    title: Text(data[index].nameContact),
                    subtitle: Text(data[index].number),
                    leading: CircleAvatar(
                      child: Text(data[index].nameContact.substring(0, 1)),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )));
  }

  _enviarUbicacion(context, EmergencyContact contact) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Compartir Ubicacion"),
              content: Text("Deseas compartir tu ubicacion con " +
                  contact.nameContact +
                  "?"),
              actions: [
                ElevatedButton(onPressed: () {}, child: Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      Sms sms = new Sms();
                      sms.sendSms(
                          "+591" + contact.number,
                          "Hola Mi Ubicacion es: https://maps.google.com/?q=" +
                              currentPosition.latitude.toString() +
                              "," +
                              currentPosition.longitude.toString());
                    },
                    child: Text("Enviar"))
              ],
            ));
  }
}
