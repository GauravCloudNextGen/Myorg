public class OpportunityTriggerHelper {
	public static void UpdateATMwithOwneronOptyCreate(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        List<AccountShare> list_Share = new List<AccountShare>();
        List<AccountTeamMember> list_Atm = new List<AccountTeamMember>();
        for(Opportunity opp : triggerNew)
        {
            if(opp.Probability == 20)
            {
                AccountTeamMember atm = new AccountTeamMember();
                atm.AccountId = opp.AccountId;
                atm.TeamMemberRole = 'Account Manager';
                atm.UserId = opp.OwnerId;
                AccountShare share = new AccountShare();
                share.AccountId = opp.AccountId;
                share.UserOrGroupId = opp.OwnerId;
                share.AccountAccessLevel = 'Read/Write';
                share.OpportunityAccessLevel = 'Read Only';
                share.CaseAccessLevel = 'Read Only';
                list_Atm.add(atm);
                list_Share.add(share);
            }
        }
        if(list_ATM!=null)
            {
                insert list_Atm;
            }
        if(list_Share!=null && list_Share.size()>0)
        {
            List<Database.saveresult> sr = Database.insert(list_Share,false);
        }
    }
    public static void UpdateOpportunity(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        Set<Id>accId = new Set<Id>();
            for(Opportunity op : triggerNew)
        	{
                accId.add(op.AccountId);
            }
        System.debug(accId);
        List<Opportunity>opportunityToUpdate = [SELECT Name,StageName,Probability,AccountId,Account.IsOppEligibleForClose__c  FROM Opportunity WHERE AccountId IN:accId AND Probability>=70 AND StageName!= 'Closed Won' AND StageName!= 'Closed Lost'];
        List<Opportunity>opportunityToClose = new List<Opportunity>();
         for(Opportunity op : opportunityToUpdate)
            {
                if(op.Account.IsOppEligibleForClose__c == True)
                    {
                        op.StageName = 'Closed Won';
                        opportunityToClose.add(op);
                    }
            }
        update opportunityToClose;
    }
    public static void UpdateAccountStatus(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        Set<Id>opportunityAccountId = new Set<Id>();
        if(TriggerNew!=null)
        {
            for(Opportunity op : TriggerNew)
            {
                opportunityAccountId.add(op.AccountId);
            }
        }
        if(TriggerOld!=null)
        {
            for(Opportunity op : TriggerOld)
            {
                opportunityAccountId.add(op.AccountId);
            }
        }
        List<Account>opportunityAccount = [SELECT Id,Active__c,(SELECT Name,StageName FROM Opportunities) FROM Account WHERE ID IN:opportunityAccountId];
        List<Account>accountToUpdate = new List<Account>();
        for(Account ac : opportunityAccount)
        {
            for(Opportunity op : ac.Opportunities)
            {
                if(op.StageName != 'Closed Won') 
                {
                   ac.Active__c = 'No';
                   break;
                }
                else
                {
                    ac.Active__c = 'Yes';
                }
            }
            accountToUpdate.add(ac);
        }
        update accountToUpdate;
    }
    public static void OpportunityDescription(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        for(Opportunity op : TriggerNew)
        {
            if(op.Amount!= null && op.Amount>100000)
            {
                op.Description = 'Hot Opportunity';
            }
        }
    }
    public static void  RecentOpportunityAmount(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        set<Id>accountId = new Set<Id>();
        if(TriggerNew!=null)
        {
            for(Opportunity op : TriggerNew)
        	{
            	accountId.add(op.AccountId);
        	}
        }
        /*if(triggerOld!=null)
        {
            for(Opportunity op : TriggerOld)
        	{
                accountId.add(op.AccountId);
        	}
        }*/
        List<Account>accountOpportunity = [SELECT Id,Recent_Opportunity_Amount__c,(SELECT Id,Name,Amount FROM Opportunities) FROM Account WHERE Id IN: accountId];
        //System.debug(accountOpportunity);
        List<Account>accountToUpdate = new List<Account>();
        if(accountOpportunity!=null && accountOpportunity.size()>0)
        {
            for(Account ac : accountOpportunity)
            {
                ac.Recent_Opportunity_Amount__c = null;
            	for(Opportunity op : ac.Opportunities)
                {
                    //System.debug(op.Name);
                    //System.debug(op.Amount);
                    ac.Recent_Opportunity_Amount__c = op.Amount;
                }
            accountToUpdate.add(ac);
        	}
        }
        //System.debug(accountToUpdate);
        if(accountToUpdate!=NULL && accountToUpdate.size()>0)
        update accountToUpdate;
    }
    public static void TransferTask(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        /*Map<Id,Id>accountId = new Map<Id,Id>();
        for(Opportunity op : TriggerOld)
            {
                if(op.AccountId!=null)
                    {
                        accountId.put(op.AccountId,op.Id);
                    }
            }
        Map<Id,Opportunity>accountOpportunity = new Map<Id,Opportunity>([SELECT accountId,Id,Name FROM Opportunity WHERE AccountId IN :accountId.keySet()]);
        Map<Id,Task>opportunityTask = new Map<Id,Task>([SELECT WhatId,Id,Subject FROM Task WHERE WhatId IN : accountId.values()]);
        for(Opportunity op : TriggerOld)
        {
            if(op.AccountId!=null)
                {
                    for(task t : opportunityTask.values())
                    {
                       t.WhatId = accountOpportunity.get(op.Id).AccountId;
                    }
                }
        }*/
        Set<Id>accountId = new Set<Id>();
        Set<Id>opportunityId = new Set<Id>();
        for(Opportunity op : TriggerOld)
            {
                if(op.AccountId!=null)
                    {
                        accountId.add(op.AccountId);
                        opportunityId.add(op.Id);
                    }
            }
        List<Opportunity>accountOpportunity = [SELECT Id,Name FROM Opportunity WHERE AccountId IN : accountId];
        List<Task>opportunityTask = [SELECT Id,WhatId FROM Task WHERE WhatId IN : opportunityId];
        List<Task>taskToUpdate = new list<Task>();
        System.debug(opportunityTask);
        for(Opportunity op : accountOpportunity)
        {
                for(Task t : opportunityTask)
                {
                    Id prev = t.WhatId;
                    t.WhatId = null;
                    System.debug(op);
                    if(op!=null)
                    {
                        if(op.Id != prev)
                            {
                                t.WhatId = op.Id;
                                t.subject = 'Email';
                                taskToUpdate.add(t);
                            	System.debug(t.WhatId);
                            }            
                    }
                }
            break;
        }
        update taskToUpdate;
    }
    public static void SendEmail(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap)
    {
        List<Messaging.SingleEmailMessage>Mails = new List<Messaging.SingleEmailMessage>();
        for(Opportunity op : TriggerNew)
        {
            if(op.Amount>10000)
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(op.OwnerId);
                System.debug(op.OwnerId);
        		mail.setSubject(op.Name + ' Opportunity Amount greater than 10000 Found');
       	 		String body = 'An Opportunity Amount ' + op.Name + ' greater than 10000 Found';
        		mail.setHTMLBody(body);
        		mail.setSaveAsActivity(false);
        		mails.add(mail);
            }
        }
        Messaging.sendEmail(mails);
    }
    public static void trig(List<Opportunity>triggerNew,Map<Id,Opportunity>triggerNewMap,List<Opportunity>triggerOld,Map<Id,Opportunity>triggerOldMap){
        System.debug(triggerNew);
    }
}