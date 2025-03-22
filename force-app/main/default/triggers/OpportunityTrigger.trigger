trigger OpportunityTrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.isBefore && Trigger.isInsert)
    {
        OpportunityTriggerHandler.beforeInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        OpportunityTriggerHandler.beforeUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
        OpportunityTriggerHandler.beforeDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        OpportunityTriggerHandler.afterInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        OpportunityTriggerHandler.afterUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        OpportunityTriggerHandler.afterDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUnDelete)
    {
        OpportunityTriggerHandler.afterUnDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
}