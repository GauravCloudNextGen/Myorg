trigger CustomerTrigger on Customer__c (before insert,before update,before delete,after insert,after update,after delete) {
	if(Trigger.isBefore && Trigger.isInsert)
    {
        CustomerTriggerHandler.beforeInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        CustomerTriggerHandler.beforeUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
        CustomerTriggerHandler.beforeDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        CustomerTriggerHandler.afterInsert(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        CustomerTriggerHandler.afterUpdate(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        CustomerTriggerHandler.afterDelete(Trigger.New,Trigger.NewMap,Trigger.Old,Trigger.OldMap);
    }
}