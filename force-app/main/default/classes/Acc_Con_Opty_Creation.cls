public class Acc_Con_Opty_Creation {
  Public Account CreateAccount(){
  Account a = new Account();
  a.Name='1';
  insert a;
  Contact c = new Contact();
  c.LastName='Satti Reddy';
  c.AccountId=a.Id;
  insert c;
  Opportunity opp= new Opportunity();
  opp.Name='Test Opportunity';
  opp.CloseDate = Date.newInstance(2012, 2, 17);
  opp.StageName='Closed Lost';
  opp.AccountId = a.Id;
  insert opp;
  return a;
 }
}