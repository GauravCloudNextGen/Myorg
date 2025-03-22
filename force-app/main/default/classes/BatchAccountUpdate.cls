global class BatchAccountUpdate implements Database.Batchable<sObject>{
	//start method
	global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
     //execute method 
     global void execute(Database.BatchableContext BC, list<Account>scope)
     {
         for(Account ac : scope)
             {
                 ac.Name = ac.Name+' Update';
             }
         update scope;
     }
	//finish method 
	global void finish(Database.BatchableContext BC)
    {
        
    }
}