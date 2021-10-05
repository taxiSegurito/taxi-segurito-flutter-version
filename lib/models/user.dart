import 'package:taxi_segurito_app/models/Person.dart';

class User extends Person {
  // faltan definir algunos atributos
  //idUser == idPerson es necesario colocar como otro atributo?
  late String email;
  late String password;

// Se deberian ir aumentando los constructores nesesarios
  User(this.email, this.password, idPerson, fullName, cellphone, registerDate,
      updateDate, status)
      : super(idPerson, fullName, cellphone, registerDate, updateDate, status);
  User.Login(this.email, this.password) : super.Default();
  User.Default() : super.Default();

  User.Insert(this.email, this.password, fullName, cellphone)
      : super.InsertForGoogleAndFacebook(fullName, cellphone);
}
