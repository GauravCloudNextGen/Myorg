public class AccountCreate {
	public void CreateAccount(String n){
        Account a = new Account();
        a.Name = n;
        a.Industry = 'Education';
        insert a;
    }
}