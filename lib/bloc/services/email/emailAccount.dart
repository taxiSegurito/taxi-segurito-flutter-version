class EmailAccount
{
  String adress;
  String password;

  EmailAccount(this.adress,this.password);

  EmailAccount.gmailApp({
    this.adress = 'xxsupersyverxx@gmail.com',
    this.password = 'comandos19'}); // contra cmbiada, desactualizado talvez usar autenticacion mas segura
}