class EmailAccount
{
  String adress;
  String password;

  EmailAccount(this.adress,this.password);

  EmailAccount.gmailApp({
    this.adress = 'tsegurito@gmail.com',
    this.password = 'taxiseguv1'});
}