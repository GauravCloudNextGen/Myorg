trigger UnDeleteCRonContactDeletion on Contact (after undelete) {
    if(trigger.New!=null && trigger.New.size()>0)
    {
        list<Contact_RelationShip__c> List_conRels = new list<Contact_RelationShip__c>();
        List_ConRels = [SELECT Id FROM Contact_RelationShip__c WHERE ISDELETED = TRUE AND  Contact__c IN:GlobalUtility.getUniqueIds(Trigger.New) ALL ROWS];
        System.debug(List_ConRels);
        undelete List_conRels;
    }
}