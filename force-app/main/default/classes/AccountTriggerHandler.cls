public class AccountTriggerHandler {
	public static void beforeInsert(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
            AccountTriggerHelper.addPrefixAsMr(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
            AccountTriggerHelper.Duplicate(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        	AccountTriggerHelper.addHelloWorld(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        	AccountTriggerHelper.SalesRep(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        	AccountTriggerHelper.CopyBillingToShipping(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        	
	}
    public static void beforeUpdate(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {  
       AccountTriggerHelper.SalesRep(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
       AccountTriggerHelper.addHelloWorld(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
       AccountTriggerHelper.Duplicate(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         for(Account a:triggerNew)
        {
            if(!a.name.contains('Mr.'))
            {
                AccountTriggerHelper.addPrefixAsMr(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
			}
		}
        
        AccountTriggerHelper.CopyBillingToShipping(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void beforeDelete(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        AccountTriggerHelper.AccountDelete(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterInsert(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        AccountTriggerHelper.createContactByLocation(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        if(!triggerNew.isEmpty())
        {
            AccountTriggerHelper.createContactByAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
		}
        AccountTriggerHelper.CloseOpportunity(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        AccountTriggerHelper.CreateContact(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterUpdate(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        AccountTriggerHelper.createContactByAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        AccountTriggerHelper.CloseOpportunity(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        AccountTriggerHelper.DeleteContact(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        AccountTriggerHelper.ContactUpdated(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterDelete(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        
	}
}