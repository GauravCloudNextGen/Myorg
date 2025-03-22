trigger UpdateCPActivenOnOppty on Customer_Project__c (after insert) {
	List<Opportunity> opps = new List<Opportunity>();
    for(Customer_Project__c cp : Trigger.New)
    {
        if(cp.Status__c == 'Active')
        {
            Opportunity opp = new Opportunity(id = cp.Opportunity__c);
            opp.Active_Customer_Project__c = True;
            opps.add(opp);
        }
    }
    update opps;
}