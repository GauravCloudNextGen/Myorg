public class AccountCreation {
    public List<Account> CreateAccount(String name, String phone, Integer n){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<n;i++)
        {
            Account acc = new Account();
            acc.Name = name + i;
            acc.Phone = phone;
            accList.add(acc);
  }
        insert accList;
        return accList;
 }
}