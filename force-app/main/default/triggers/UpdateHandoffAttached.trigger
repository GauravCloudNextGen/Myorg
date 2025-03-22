trigger UpdateHandoffAttached on Top_X_Designation__c (after insert, after update, after delete) {
	List<Opportunity> listOppUpdate = new List<Opportunity>();
    List<Opportunity> listOpp = new List<Opportunity>();
    Set<Id> setOppId = new Set<Id>();
    Set<Id> setOppDelete = new Set<Id>();
    map<Id,Id> mapDocAttchTrue = new map<Id,Id>();
    map<Id,Id> mapDocAttchFalse = new map<Id,Id>();
    map<Id,Id> mapDelete = new map<Id,Id>();
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Top_X_Designation__c ada: Trigger.new)
        {
            if(ada.Document_Attached__c == True && ada.Type__c == 'Contract Flow Down/Handoff')
            {
                mapDocAttchTrue.put(ada.Opportunity__c,ada.Id);
                setOPPId.add(ada.Opportunity__c);
            }
            else
            {
                mapDocAttchFalse.put(ada.Opportunity__c,ada.Id);
                setOPPId.add(ada.Opportunity__c);
            }
        }
    }
    if(Trigger.isDelete)
    {
        for(Top_X_Designation__c ada: Trigger.old)
        {
            mapDelete.put(ada.Opportunity__c,ada.Id);
            setOPPId.add(ada.Opportunity__c);
            setOppDelete.add(ada.Opportunity__c);
        }
    }
    listOpp = [SELECT Id,Handoff_Attached__c FROM Opportunity WHERE ID IN: setOppId];
    if(listOpp.size()>0 && listOpp!=NULL)
    {
        for(Opportunity opp : listOpp)
            {
                if(mapDocAttchTrue.containsKey(opp.Id))
                {
                    opp.Handoff_Attached__c='Yes';
                }
                if(mapDocAttchFalse.containsKey(opp.Id))
                {
                    opp.Handoff_Attached__c='No';
                }
                if(setOppDelete.contains(opp.Id))
                    {
                        opp.Handoff_Attached__c='';
                    }
                listOppUpdate.add(opp);
            }
    }
    if(listOppUpdate.size()>0 && listOppUpdate!=NULL)
        {
            update listOppUpdate;
            System.debug('LLLLLL'+ listOppUpdate);
        }
}