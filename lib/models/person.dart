class Person {
  late int idPerson;
  late String fullName;
  late String cellphone;
  late DateTime registerDate;
  late DateTime updateDate;
  late int status;

  Person(this.idPerson, this.fullName, this.cellphone, this.registerDate,
      this.updateDate, this.status);

  Person.insert(this.fullName, this.cellphone);
}
