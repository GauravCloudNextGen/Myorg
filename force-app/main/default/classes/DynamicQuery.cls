public class DynamicQuery {
	public static void accQuery(){
        String accountsQuery = 'SELECT Id, Name, Rating, Industry, AnnualRevenue FROM Account';
        List<Account> lstAccounts = Database.query(accountsQuery);
        for(Account ac : lstAccounts){
            System.debug(ac.Name);
        }
    }
    
}