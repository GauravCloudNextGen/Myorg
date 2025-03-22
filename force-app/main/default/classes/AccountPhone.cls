public class AccountPhone {
	public Account PrintPhone(String phoneNumber){
        Account a = new Account();
        a = [SELECT Name,Phone FROM Account WHERE Phone = : phoneNumber LIMIT 1];
        System.debug(a.Name);
        return a;
    }
}