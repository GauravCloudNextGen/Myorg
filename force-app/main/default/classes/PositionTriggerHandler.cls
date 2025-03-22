public class PositionTriggerHandler {
	public static void beforeInsert(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
         PositionTriggerHelper.FillValues(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void beforeUpdate(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {  
         PositionTriggerHelper.FillValues(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void beforeDelete(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
        
	}
    public static void afterInsert(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
		
	}
    public static void afterUpdate(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
       
	}
    public static void afterDelete(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
       
	}
    public static void afterUnDelete(List<Position__c>triggerNew,Map<Id,Position__c>triggerNewMap,List<Position__c>triggerOld,Map<Id,Position__c>triggerOldMap)
    {
       
	}
}