public class OpportunityTriggerHandler {
	public static void beforeInsert(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        // Auto-set CloseDate to the end of current month if blank on insert
        setCloseDateIfBlankToEndOfMonth(triggerNew);
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
        // Auto-set CloseDate to the end of current month if blank on update
        setCloseDateIfBlankToEndOfMonth(triggerNew);
    }
    public static void AfterUpdate(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.UpdateATMwithOwneronOptyCreate(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.UpdateOpportunity(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.UpdateAccountStatus(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         OpportunityTriggerHelper.trig(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }

    // Core logic: set CloseDate to end of current month if null
    private static void setCloseDateIfBlankToEndOfMonth(List<Opportunity> opps) {
        if (opps == null || opps.isEmpty()) return;

        Date today = Date.today();
        Integer lastDay = Date.daysInMonth(today.year(), today.month());
        Date endOfMonth = Date.newInstance(today.year(), today.month(), lastDay);

        for (Opportunity o : opps) {
            if (o.CloseDate == null) {
                o.CloseDate = endOfMonth;
            }
        }
    }

    public static void beforeDelete(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.TransferTask(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }

    public static void afterDelete(List<Opportunity> newList, Map<Id, Opportunity> newMap, List<Opportunity> oldList, Map<Id, Opportunity> oldMap) {
        // No-op for current requirement
    }
    public static void AfterUnDelete(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        //OpportunityTriggerHelper.RecentOpportunityAmount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
}
