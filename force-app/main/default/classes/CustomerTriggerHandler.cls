public class CustomerTriggerHandler {
	public static void beforeInsert(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
       
    }
    public static void AfterInsert(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
        
    }
    public static void beforeUpdate(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
        CustomerTriggerHelper.UpdateAccountTeam(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterUpdate(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
        
    }
    public static void beforeDelete(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
        CustomerTriggerHelper.DeleteAccountTeam(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterDelete(List<Customer__c>triggerNew,Map<Id,Customer__c>triggerNewMap,List<Customer__c>triggerOld,Map<Id,Customer__c>triggerOldMap)
    {
        
    }
}