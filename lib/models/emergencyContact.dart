class EmergencyContact {
  late int idEmergencyContact;
  late String nameContact;
  late String number;
  late int idClientUser;
  
  //EmergencyContact(){}
  EmergencyContact.getByIdUser(
    this.idClientUser
    );

  EmergencyContact.select(this.idEmergencyContact,
    this.nameContact,
    this.number,
    this.idClientUser
    );
  
  EmergencyContact.insert(
    this.nameContact,
    this.number,
    this.idClientUser
    );
  
  EmergencyContact.update(
  int idEmergencyContact,
  String nameContact,
  String number,) {
    this.idEmergencyContact = idEmergencyContact;
    this.nameContact = nameContact;
    this.number = number;
  }
  EmergencyContact.delete(int idEmergencyContact) 
  {
    this.idEmergencyContact = idEmergencyContact;
  }

  EmergencyContact.fromJson(Map<String, dynamic> json) {
    idEmergencyContact = json['idEmergencyContact'];
    nameContact = json['nameContact'];
    number = json['number'];
    idClientUser= json['idClientUser'];
  }
}