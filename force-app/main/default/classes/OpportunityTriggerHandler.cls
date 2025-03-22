public class OpportunityTriggerHandler {
	public static void beforeInsert(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
       //OpportunityTriggerHelper.OpportunityDescription(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterInsert(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.UpdateATMwithOwneronOptyCreate(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        //OpportunityTriggerHelper.UpdateOpportunity(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        //OpportunityTriggerHelper.UpdateAccountStatus(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        //OpportunityTriggerHelper.SendEmail(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void beforeUpdate(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
       //OpportunityTriggerHelper.OpportunityDescription(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
       //OpportunityTriggerHelper.SendEmail(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
       //OpportunityTriggerHelper.trig(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterUpdate(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.UpdateATMwithOwneronOptyCreate(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.UpdateOpportunity(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.UpdateAccountStatus(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         OpportunityTriggerHelper.trig(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void beforeDelete(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.TransferTask(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterDelete(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.UpdateAccountStatus(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
        //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    public static void AfterUnDelete(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
}