public class BatchOpportunityRecordCount implements Database.Batchable<sObject>,Database.stateful{
	public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext BC)
        {
            return Database.getQueryLocator([SELECT Id,Name FROM Opportunity]);
        }
    
    public void execute(Database.BatchableContext BC , list<Opportunity>opps)
    {
        for(Opportunity op:opps)
        {
            //op.LeadSource = 'web';
            recordCount = recordCount + 1;
        }
        //System.debug(opps.size());
    }
    
    public void finish(database.BatchableContext BC)
    {
        System.debug('Record Count '+ recordCount);
    }
}