public class CaseTriggerHelper {
	public static void UpdateRating(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        set<Id>accId = new set<Id>();
        if(triggerNew!=null)
        {
            for(Case c : triggerNew)
        	{
                accId.add(c.AccountId);
            }  
        }
        if(triggerOld!=null)
        {
            for(Case c : triggerOld)
        	{
                accId.add(c.AccountId);
            }  
        }
      
        list<Account>accList = [SELECT Id,Rating,(SELECT Id,Status FROM Cases WHERE Status = 'Closed') FROM Account WHERE ID IN : accId];
        list<Account>accountToUpdate = new list<Account>();
        if(accList.size()>0 && accList!=null)
        {
            for(Account ac : accList)
            {
                Integer Count = 0;
                for(Case c : ac.Cases)
                {
                    Count++;
                }
                if(Count<2)
                {
                   ac.Rating = 'Cold';
                }
                else if(Count>=2 && Count<5)
                {
                    ac.Rating = 'Warm';
                }
                else{
                    ac.Rating = 'Hot';
                }
                accountToUpdate.add(ac);
            }
        }
        if(accountToUpdate.size()>0 && accountToUpdate!=null)
		update accountToUpdate;   
    }
    public static void UpdateAccount(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        Set<Id>accountIds = new Set<Id>();
        if(triggerNew!=null)
        {
            for(Case c : triggerNew)
        	{
                accountIds.add(c.AccountId);
            }  
        }
      if(triggerOld!=null)
        {
            for(Case c : triggerOld)
        	{
                accountIds.add(c.AccountId);
            }  
        }
        List<Account>accountList = [SELECT Id,Description,(SELECT Id,CaseNumber,Status FROM Cases) FROM Account WHERE Id IN: accountIds];
        List<Account>accountToUpdate = new List<Account>();
        if(accountList.size()>0 && accountList!=null)
        {
            for(Account ac : accountList)
        	{
                ac.Description=' ';
            	for(Case c : ac.Cases)
            	{
                	ac.Description += '  ' + 'Case Number- '  + c.CaseNumber + ' ' + 'Case Status- ' + c.Status + ' ;';
                    system.debug(ac.Description);
            	}
                accountToUpdate.add(ac);
        	}
         	if(accountToUpdate!= null && accountToUpdate.size()>0)
        	{
            	update accountToUpdate;
        	}
        }
	}
    public static void UpdateTask(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        Set<Id>caseIds = new Set<Id>();
        for(Case c : triggerNew)
        {
            caseIds.add(c.Id);
        }
        List<Case>caseTask = [SELECT Id,Status,(SELECT Status FROM Tasks) FROM Case WHERE ID IN:caseIds];
        List<Task>tastToUpdate = new List<Task>();
        for(Case c : caseTask)
        {
            for(Task t : c.Tasks)
            {
                t.Status = c.Status; 	
                tastToUpdate.add(t);
            }
        }
        if(tastToUpdate!=null && tastToUpdate.size()>0)
        {
            update tastToUpdate;
        }
    }
    public static void CreateTask(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        Set<Id>caseIds = new Set<Id>();
        for(Case c : triggerNew)
        {
            caseIds.add(c.Id);
        }
        List<Case>caseTask = [SELECT Id,CaseNumber,Status FROM Case WHERE ID IN:caseIds];
        List<task>createTask = new List<task>();
        for(Case c : caseTask)
        {
            Task t = new Task();
            t.subject = c.CaseNumber;
            t.status = c.Status;
            t.WhatId = c.Id;
            createTask.add(t);
        }
        insert createTask;
    }
    public static void SendEmail(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        List<task>createTask = new List<task>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Case c : triggerOld)
        {
            Task t = new Task();
            t.subject = 'Email';
            t.WhatId = c.AccountId;
            createTask.add(t);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        	mail.setTargetObjectId(c.OwnerId);
        	mail.setSubject(c.Id + ' Case is deleted');
       	 	String body = 'A Case ' + c.id + ' is deleted';
        	mail.setHTMLBody(body);
        	mail.setSaveAsActivity(false);
        	mails.add(mail);
        }
        insert createTask;
        Messaging.sendEmail(mails);
    }
    public static void LinkContact(List<Case>triggerNew,Map<Id,Case>triggerNewMap,List<Case>triggerOld,Map<Id,Case>triggerOldMap)
    {
        List<Contact>contactsEmail = [SELECT Email FROM Contact];
        Map<Case,Contact>linkContact = new Map<Case,Contact>();
        List<Contact>contactToInsert = new List<Contact>();
        for(Case c : TriggerNew)
        {
            Boolean Found = false;
            for(Contact con : contactsEmail)
            {
                if(c.SuppliedEmail == con.Email)
                {
                    c.ContactId = con.Id;
                    Found = true;
                    break;
                }
            }
            if(Found == False)
            {
                Contact conNew = new Contact(LastName = 'ContactByCase');
            	contactToInsert.add(conNew);
            	linkContact.put(c,conNew);
            }
        }
        if(contactToInsert!=null && contactToInsert.size()>0)
        insert contactToInsert;
        //system.debug('Contact inserted');
        if(linkContact!=null && linkContact.size()>0)
        {
            //System.debug('in');
           for(Case c : linkContact.KeySet())
        	{
                //System.debug('inin');
            	Id ContactId = linkContact.get(c).Id;
            	//System.debug(ContactId);
            	c.ContactId = ContactId;
        	} 
        }
    }
}