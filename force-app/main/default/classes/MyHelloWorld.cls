public class MyHelloWorld {
	public static void addHelloWord(List<Account> acc)
	{
		for(Account a:acc)
		{
			if(a.Hello__c!='World')
			{
				a.Hello__c='World';
            }
        }
    }
}