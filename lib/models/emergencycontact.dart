class EmergencyContact {
  late int idEmergencyContact;
  late String nameContact;
  late String number;
  late int clientuserIdclientuser;

  EmergencyContact.fromJson(Map<String, dynamic> json) {
    idEmergencyContact = json['idEmergencyContact'];
    nameContact = json['nameContact'];
    number = json['number'];
  }

  EmergencyContact(this.idEmergencyContact, this.nameContact, this.number);
}
