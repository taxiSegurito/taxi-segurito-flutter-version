class AuditData {
  late DateTime registerDate;
  late DateTime updateDate;
  late int status;

  AuditData(this.registerDate, this.updateDate, this.status);

  AuditData.Default();
}
