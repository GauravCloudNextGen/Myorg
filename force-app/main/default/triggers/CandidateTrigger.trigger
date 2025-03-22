trigger CandidateTrigger on Candidate1__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
	if(Trigger.isBefore && Trigger.isInsert)
    {
        Candidate1TriggerHandler.beforeInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        Candidate1TriggerHandler.beforeUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
        Candidate1TriggerHandler.beforeDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        Candidate1TriggerHandler.afterInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Candidate1TriggerHandler.afterUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        Candidate1TriggerHandler.afterDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUnDelete)
    {
        Candidate1TriggerHandler.afterUnDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
}