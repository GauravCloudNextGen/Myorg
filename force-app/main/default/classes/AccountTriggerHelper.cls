public class AccountTriggerHelper {
	public static void addPrefixAsMr(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        for(Account a:triggerNew)
        {
            a.Name='Mr.'+ a.name;
		}
	}
    public static void createContactByAccount(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        Set<Id> accountIds = new Set<Id>();
        List<Contact> contactListToInsert = new List<Contact>();
        for(Account a:triggerNew)
        {
            accountIds.add(a.Id);
		}
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Id IN:accountIds];
        if(accList!=NULL)
        {
            for(Account a: accList)
            {
                Contact c = new Contact(LastName='ContactByAccount',AccountId=a.Id);
                contactListToInsert.add(c);
            }
            if(!contactListToInsert.isEmpty()){
                insert contactListToInsert;
            }
		}
	}
    public static void Duplicate(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        List<Account>dup = [SELECT Id,Name FROM Account];
        for(Account a : TriggerNew)
            {
                for(Account a1 : dup)
                {
                    if(a.name == a1.name)
                    {
                        a.name.addError('You cannot Create the duplicate account');
                    }
                }
            }
    }
    public static void addHelloWorld(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        for(Account a : TriggerNew)
        {
            if(a.Hello__c!='World')
                {
                    a.Hello__c='World';
                }
        }
    }
    public static void AccountDelete(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        for(Account acc : triggerOld)
        {
            acc.addError('You cannot delete the Account record');
        }
    }
    public static void createContactByLocation(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        list<contact> listContact = new list<contact>();
        map<Id,decimal> mapAcc = new map<Id,decimal>();
        for(Account ac : triggerNew)
        {
            mapAcc.put(ac.Id,ac.NumberofLocations__c);
        }
        if(mapAcc.size()>0 && mapAcc!=null)
        {
            for(Id acId : mapAcc.keyset())
            {
                for(Integer i = 0;i<mapAcc.get(acId);i++)
                {
                    System.debug(mapAcc.get(acId));
                    System.debug(acId);
                    Contact newContact = new Contact();
                    newContact.AccountId = acId;
                    newContact.LastName = 'contact'+(i+1);
                    listContact.add(newContact);
                }
            }
        }
        if(listContact.size()>0 && listContact!=null)
        {
            insert listContact;
        }
    }
    public Static void SalesRep(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        Set<Id>setAccOwner = new Set<Id>();
        for(Account Acc : triggernew)
            {
                setAccOwner.add(Acc.OwnerId);
            }
        Map<Id,User>user_Map = new Map<Id,User>([SELECT Name FROM User WHERE Id IN:setAccOwner]);
        for(Account Acc: TriggerNew)
            {
                User usr = user_Map.get(Acc.OwnerId);
                Acc.Sales_Rep__c = usr.Name;
            }
    }
    public Static void CloseOpportunity(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        Map<Id,Boolean>accId = new Map<Id,Boolean>();
        if(triggerNew!=null)
        {
            for(Account ac : triggerNew)
        	{
                if(ac.IsOppEligibleForClose__c == True)
                accId.put(ac.Id,True);
            }  
        }
        List<Opportunity>accountOpportunity = [SELECT Name,StageName,Probability,AccountId FROM Opportunity WHERE Probability >=70 AND StageName!= 'Closed Won' AND StageName!= 'Closed Lost' AND AccountID IN: accId.KeySet()];
        List<Opportunity>opportunityToClose = new List<Opportunity>();
        System.Debug(accountOpportunity);
            for(Opportunity op : accountOpportunity)
            {
                if(accId.containsKey(op.AccountId))
                {
                    op.StageName = 'Closed Won';
                	opportunityToClose.add(op);
                    System.Debug(op.StageName);
                }
            }
        update opportunityToClose;
	}
    public static void CreateContact(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        List<Contact>contactList = new List<Contact>();
        for(Account acc : triggerNew)
        {
            for(Integer i=0;i<3;i++)
            {
                Contact c = new Contact();
                c.LastName = acc.Name + ' Contact ' + (i+1);
                c.AccountId = acc.Id;
                contactList.add(c);
            }
        }
        insert contactList;
    }
    public static void DeleteContact(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        List<Contact>accountContacts = [SELECT Id,Name,AccountId FROM Contact WHERE AccountId IN : triggerNew];
        List<Contact>contactToDelete = new List<Contact>();
        for(Account ac : TriggerNew)
        {
            for(Contact c : accountContacts)
            {
                if(ac.Type == 'Partner' && c.AccountId == ac.Id)
                    {
                        contactToDelete.add(c);
                    }
            }
        }
        delete contactToDelete;
    }
    public static void CopyBillingToShipping(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        for(Account ac : TriggerNew)
            {
                if(ac.CopyBillingToShipping__c == True)
                    {
                        ac.ShippingStreet = ac.BillingStreet;
                        ac.ShippingCity =  ac.BillingCity;
                        ac.ShippingPostalCode = ac.BillingPostalCode;
                        ac.ShippingState = ac.BillingState;
                        ac.ShippingCountry = ac.BillingCountry;
                    }
            }
    }
    public static void ContactUpdated(List<Account>triggerNew,Map<Id,Account>triggerNewMap,List<Account>triggerOld,Map<Id,Account>triggerOldMap)
    {
        List<Contact>accountContacts = [SELECT Name,AccountId,LastModifiedDate,Account.Name,Account.LastModifiedDate FROM Contact WHERE AccountId IN : triggerNewMap.KeySet()];
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        //System.debug(accountContacts);
        for(Account ac : TriggerOld)
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        	mail.setTargetObjectId(ac.OwnerId);
        	mail.setSubject('Contact Update');
            String body = '';
            Boolean Found = False;
            for(Contact c : accountContacts)
            {
                if(c.AccountId == ac.Id && c.LastModifiedDate > ac.LastModifiedDate)
                {
       	 			body += 'Contact Name- ' + c.Name + ' ;';
                    Found = true;
                }
            }
            if(Found == true)
                {
                    mail.setHTMLBody(body);
        			mail.setSaveAsActivity(false);
           			mails.add(mail);
                }
        }
        Messaging.sendEmail(mails);
    }
}