trigger LeadTrigger on Lead (before insert,before update,before delete,after insert,after update,after delete) 
{
    if(Trigger.isBefore && Trigger.isInsert)
    {
        LeadTriggerHandler.beforeInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        LeadTriggerHandler.beforeUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        LeadTriggerHandler.afterInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        LeadTriggerHandler.afterUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        LeadTriggerHandler.afterDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
}