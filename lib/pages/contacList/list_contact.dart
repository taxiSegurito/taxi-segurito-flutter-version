import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_segurito_app/bloc/services/sms_twilio.dart';
import 'package:taxi_segurito_app/components/toast/toats_glo.dart';
import 'package:taxi_segurito_app/models/emergencycontact.dart';
import 'package:taxi_segurito_app/pages/contacList/location_functionality.dart';
import 'package:geolocator/geolocator.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  LocationFunctionality locationFunctionality = LocationFunctionality();
  late Future<List<EmergencyContact>> emergycontact;
  late List<EmergencyContact> contacts;
  late Position currentPosition = Position(
      latitude: 0,
      longitude: 0,
      accuracy: 0,
      altitude: 0,
      speed: 0,
      heading: 0,
      timestamp: DateTime.now(),
      speedAccuracy: 0);

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
      GlobalToast.displayToast(Text("Revisa que este activa tu ubicacion"),
          Colors.redAccent, Icon(Icons.sms_failed), 1);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    emergycontact = locationFunctionality.getContacts();
    _getCurrentLocation();
    fToast = FToast();
    fToast.init(context);
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
              contacts = snapshot.data!;

              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      _getCurrentLocation();
                      print(currentPosition.latitude);
                      print(currentPosition.longitude);
                      if (currentPosition.latitude == 0.0 ||
                          currentPosition.longitude == 0.0) {
                        GlobalToast.displayToast(
                            Text("Vuelva a seleccionar el contacto"),
                            Colors.redAccent,
                            Icon(Icons.sms_failed),
                            1);
                      } else {
                        this._shareLocation(context, contacts[index]);
                      }
                    },
                    title: Text(contacts[index].nameContact),
                    subtitle: Text(contacts[index].number),
                    leading: CircleAvatar(
                      child: Text(contacts[index].nameContact.substring(0, 1)),
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

  _shareLocation(context, EmergencyContact contact) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Compartir Ubicacion"),
              content: Text("Deseas compartir tu ubicacion con " +
                  contact.nameContact +
                  "?"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      Sms sms = new Sms();
                      sms.sendSms(
                          "+591" + contact.number,
                          "Hola Mi Ubicacion es: https://maps.google.com/?q=" +
                              currentPosition.latitude.toString() +
                              "," +
                              currentPosition.longitude.toString());
                      GlobalToast.displayToast(Text("Message enviado"),
                          Colors.greenAccent, Icon(Icons.check), 2);
                      Navigator.pop(context);
                    },
                    child: Text("Enviar"))
              ],
            ));
  }
}
