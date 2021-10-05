import 'package:taxi_segurito_app/models/user.dart';

class ClientUser extends User {
  //Esto es nesesario volver a incluir este atributo?
  //late int idUser;
  late String typeRegister;

  ClientUser(this.typeRegister, email, password, idPerson, fullName, cellphone,
      registerDate, updateDate, status)
      : super(email, password, idPerson, fullName, cellphone, registerDate,
            updateDate, status);

  ClientUser.Default() : super.Default();

  ClientUser.Insert(this.typeRegister, email, password, fullName, cellphone)
      : super.Insert(email, password, fullName, cellphone);
}
