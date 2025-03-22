public class AccountChirag {
	public Account CreateAccount(String n){
        Account a = new Account();
        a.Name = n;
        insert a;
        Contact c = new Contact();
        c.LastName = 'ContactByAccount';
        c.AccountId = a.Id;
        insert c;
        return a;
    }
}