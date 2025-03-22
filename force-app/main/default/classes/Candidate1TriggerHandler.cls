public class Candidate1TriggerHandler {
	public static void beforeInsert(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
	}
    public static void beforeUpdate(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {  
         
	}
    public static void beforeDelete(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
        
	}
    public static void afterInsert(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
        Candidate1TriggerHelper.LinkSkills(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterUpdate(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
        Candidate1TriggerHelper.LinkSkills(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterDelete(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
        
	}
    public static void afterUnDelete(List<Candidate1__c>triggerNew,Map<Id,Candidate1__c>triggerNewMap,List<Candidate1__c>triggerOld,Map<Id,Candidate1__c>triggerOldMap)
    {
        
	}
}