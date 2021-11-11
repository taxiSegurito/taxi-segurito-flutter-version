class EmailAccount
{
  String adress;
  String password;

  EmailAccount(this.adress,this.password);

  EmailAccount.gmailApp({
    this.adress = 'taxisegurito2021@gmail.com',
    this.password = 'TAxi54321'}); // contra cmbiada, desactualizado talvez usar autenticacion mas segura
}