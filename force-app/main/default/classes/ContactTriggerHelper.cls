public class ContactTriggerHelper {
	public static void PrimaryContact(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    { 
        Map<Id,Boolean>primaryAccount = new Map<Id,Boolean>();
        List<contact>contactList = [SELECT Name,Primary_Contact__c,AccountId FROM Contact WHERE (Primary_Contact__c = True AND AccountId!=Null)];
        for(Contact c : contactList)
        {
            primaryAccount.put(c.AccountId,True);
        }
        for(Contact c : TriggerNew)
        {
            if(c.Primary_Contact__c == True && c.AccountId!=Null && !primaryAccount.containsKey(c.AccountId))
            {
                primaryAccount.put(c.AccountId,True);
                //System.debug(c.AccountId);
            }   
            else if(c.Primary_Contact__c == True)
            {
                 c.addError('Account can not have two primary Contacts');
                //System.debug('error');
            }
        }
    }
    public static void CreateAccount(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        List<Account>AccountToInsert = new List<Account>();
        Map<Contact,Account>mapAccount = new Map<Contact,Account>();
        for(Contact c : TriggerNew)
        {
            if(c.AccountId == null)
            {
                //System.debug('in');
                Account ac = new Account();
                ac.Name = c.LastName;
                AccountToInsert.add(ac);
                mapAccount.put(c,ac);
                //system.debug(ac.Name);
            }
        }
        //System.debug(AccountToInsert);
        insert AccountToInsert;
        //List<Contact>ContactUpdate = [SELECT Id,AccountId FROM Contact WHERE Id IN : mapAccount.KeySet()];
        //System.debug(mapAccount.size());
        for(Contact c : mapAccount.KeySet())
        {
            Id accountId = mapAccount.get(c).Id;
            //System.debug(accountId);
            c.AccountId = accountId;
        }
    }
    public static void Sync(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        Map<Contact,Id>contactAccount = new Map<Contact,Id>();
        for(Contact c : TriggerNew)
        {
            if(c.AccountId!= null)
                {
                    contactAccount.put(c,c.AccountId);
                }
        }
        Map<Id,Account>accountData = new Map<Id,Account>([SELECT Id,Phone,Fax FROM Account WHERE Id IN: contactAccount.Values()]);
        for(Contact c : contactAccount.KeySet())
        {
            if(c.Sync__c == True)
                {
                    System.debug('in');
                    c.Phone = accountData.get(c.AccountId).Phone;
                    c.Fax = accountData.get(c.AccountId).Fax;
                    c.Sync__c = False;
                }
        }
    }
    public static void UpdateAccountDesc(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        set<Id>accountId = new set<Id>();
        if(TriggerNew!=null)
            {
                for(Contact c : TriggerNew)
        		{
            		if(c.AccountId!=null)
            		{
                		accountId.add(c.accountId);
            		}
        		}
            }
        if(TriggerOld!=null)
            {
                for(Contact c : TriggerOld)
        		{
            		if(c.AccountId!=null)
            		{
                		accountId.add(c.accountId);
            		}
        		}
            }
        List<Account> accountContacts = [SELECT Id,Description,(SELECT Name,CreatedDate FROM Contacts) FROM Account WHERE Id IN :accountId];
        List<Account>accountToUpdate = new List<Account>();
           for(Account ac : accountContacts)
        	{
            	ac.Description = '';
            	for(Contact c : ac.contacts)
                {
                    if(c == null)
                        {
                            ac.Description = '';
                        }
                	ac.Description+= 'Case Name - ' + c.Name + ' created Date- ' + c.CreatedDate + ' ;';
            	}
            accountToUpdate.add(ac);
        	} 
        if(accountToUpdate!= null && accountToUpdate.size()>0)
        	{
            	update accountToUpdate;
        	}
    }
    
    public static void OpportunityAmount(List<Contact>triggerNew,Map<Id,Contact>triggerNewMap,List<Contact>triggerOld,Map<Id,Contact>triggerOldMap)
    {
        set<Id>accountId = new Set<Id>();
        for(Contact c : TriggerNew)
        {
            if(c.AccountId!=null)
            {
                accountId.add(c.AccountId);
            }
        }
        List<Account>accountOpportunity = [SELECT Id,Description,(SELECT Id,Amount FROM Opportunities) FROM Account WHERE Id IN : accountId];
        List<Opportunity>oppToCreate = new List<Opportunity>();
        List<Account>accToUpdate = new List<Account>();
        for(Account ac : accountOpportunity)
        {
            ac.Description='';
            Decimal totalAmount = 0;
            if(ac.Opportunities.size() == 0)
                {
                    System.debug('in');
                    Opportunity op1 = new Opportunity();
                    op1.Name = 'OppByAccount';
                    op1.CloseDate = System.Today();
                    op1.AccountId = ac.Id;
                    op1.StageName = 'Prospecting';
                    oppToCreate.add(op1);
                    accToUpdate.add(ac);
                }
            else{
                for(Opportunity op : ac.Opportunities)
            	{
                 	totalAmount+=op.Amount;
            	}
            	ac.Description = 'Total Opportunity Amount- ' + totalAmount;
                accToUpdate.add(ac);
            	System.debug(ac.Description);
            }
        }
        if(oppToCreate!=null && oppToCreate.size()>0)
        {
           insert oppToCreate; 
        }
        if(accToUpdate!=null && accToUpdate.size()>0)
        {
            update accToUpdate;
        }
    }
}