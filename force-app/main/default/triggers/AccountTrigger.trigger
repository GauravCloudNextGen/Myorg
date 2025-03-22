trigger AccountTrigger on Account (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore && Trigger.isInsert)
    {
        AccountTriggerHandler.beforeInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        AccountTriggerHandler.beforeUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
        AccountTriggerHandler.beforeDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        AccountTriggerHandler.afterInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        AccountTriggerHandler.afterUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        AccountTriggerHandler.afterDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
}