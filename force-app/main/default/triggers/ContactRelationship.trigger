trigger ContactRelationship on Contact (before insert) {
	list<Contact_Relationship__c>conList = new list<Contact_Relationship__c>();
    for(Contact c : Trigger.New)
    {
        if(c.Contact_Relationship__c == true)
        {
            Contact_Relationship__c cr = new Contact_Relationship__c();
            cr.Name = c.LastName;
            cr.Contact__c = c.Id;
            conList.add(cr);
        }
    }
    if(conList.size()>0)
    {
        insert conList;
    }
}