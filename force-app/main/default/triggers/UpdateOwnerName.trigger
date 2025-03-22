trigger UpdateOwnerName on Contact_Relationship__c (before update) {
	set<Id> Idset = new Set<Id>();
    map<Id,String> mapName = new Map<Id,String>();
    for(Contact_Relationship__c cr : Trigger.New)
    {
        Idset.add(cr.OwnerId);
    }
    list<User> u = [SELECT Id,Name from USER WHERE Id IN: Idset];
    for(User list_users: u)
    {
        mapName.put(list_users.Id,list_users.Name);
    }
    if(u!=null && u.size()>0)
        {
            for(Contact_Relationship__c c: Trigger.New)
            {
                c.Contact_Relationship_Name__c = mapName.get(c.OwnerId);
            }
        }
}