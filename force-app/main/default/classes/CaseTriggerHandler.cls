public class CaseTriggerHandler {
	public static void beforeInsert(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        CaseTriggerHelper.LinkContact(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void beforeUpdate(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {  
         
	}
    public static void beforeDelete(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        CaseTriggerHelper.SendEmail(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterInsert(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
		CaseTriggerHelper.UpdateRating(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        CaseTriggerHelper.UpdateAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        CaseTriggerHelper.CreateTask(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterUpdate(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        CaseTriggerHelper.UpdateRating(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
        CaseTriggerHelper.UpdateAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        CaseTriggerHelper.UpdateTask(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        
	}
    public static void afterDelete(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
       CaseTriggerHelper.UpdateRating(triggerNew,triggerNewMap,triggerOld,triggerOldMap); 
       CaseTriggerHelper.UpdateAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
    public static void afterUnDelete(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
       CaseTriggerHelper.UpdateRating(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
       CaseTriggerHelper.UpdateAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
	}
}