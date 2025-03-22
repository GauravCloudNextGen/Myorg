public class LeadTriggerHandler {
	public static void beforeInsert(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        LeadTriggerHelper.DuplicateEmail(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterInsert(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        
    }
    public static void beforeUpdate(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        LeadTriggerHelper.DuplicateEmail(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterUpdate(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        
    }
    public static void AfterDelete(List<Lead>triggerNew,Map<Id,Lead>triggerNewMap,List<Lead>triggerOld,Map<Id,Lead>triggerOldMap)
    {
        
    }
}