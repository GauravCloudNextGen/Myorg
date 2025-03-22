@isTest
public class ContactTriggerTest {
    @testSetup static void setup(){
        Account ac = new Account(name = 'Testing');
        insert ac;
        Account ac2 = new Account(name = 'Testing2');
        insert ac2;
        List<Contact>testContacts = new List<Contact>();
        for(Integer i=0;i<=5;i++){
            testContacts.add(new Contact(LastName='Test Contact '+ i,Contact_Relationship__c = true));
        }
        Contact c1 = new Contact(LastName = 'c1',Contact_Relationship__c = true);
        insert c1;
    }
    public static testMethod void insertPrimary()
    {
        Account ac1 = [SELECT Id FROM Account WHERE Name = 'Testing' LIMIT 1];
        Account ac2 = [SELECT Id FROM Account WHERE Name = 'Testing2' LIMIT 1];
        Contact c1 = new Contact(LastName = 'Test',Primary_Contact__c=True,AccountId = ac2.Id,Sync__c=true);
        Opportunity op = new Opportunity(Name = 'op1',StageName = 'Closed Won',CloseDate = System.Today(),AccountId = ac2.Id,Amount = 1000);
        insert op;
        insert c1;
        c1.Active__c='Yes';
        c1.Primary_Contact__c=False;
        update c1;
        List<Contact>testContacts = new List<Contact>();
        for(Integer i=0;i<=5;i++)
        {
            testContacts.add(new Contact(LastName='Test Contact '+ i,Primary_Contact__c=True,AccountId = ac1.Id));
        }
        try{
            insert testContacts;
        }
        catch(Exception e){
            System.debug('We want to see this. This means the trigger is working');
        }
    }
}