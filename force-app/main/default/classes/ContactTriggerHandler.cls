public class ContactTriggerHandler {
	public static void beforeInsert(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
         ContactTriggerHelper.PrimaryContact(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         ContactTriggerHelper.CreateAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        ContactTriggerHelper.Sync(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
	}
   	public static void beforeUpdate(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {  
         ContactTriggerHelper.PrimaryContact(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         ContactTriggerHelper.Sync(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
	}
    public static void beforeDelete(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        
	}
    public static void afterInsert(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        ContactTriggerHelper.Sync(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        ContactTriggerHelper.UpdateAccountDesc(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
        ContactTriggerHelper.OpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);  
	}
    public static void afterUpdate(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        ContactTriggerHelper.Sync(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        ContactTriggerHelper.UpdateAccountDesc(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterDelete(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
       ContactTriggerHelper.UpdateAccountDesc(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterUnDelete(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
      ContactTriggerHelper.UpdateAccountDesc(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
}