trigger DeleteCRonContactDeletion on Contact (before delete) {
	for(Contact c : Trigger.Old)
    {
        List<Contact_relationship__c> CR = new List<Contact_relationship__c>();
        CR = [Select Id from Contact_Relationship__c where Contact__c IN:GlobalUtility.getUniqueIds(Trigger.Old)];
        delete CR;
    }
}