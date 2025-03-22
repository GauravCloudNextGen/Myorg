@isTest
public class AccountTriggerTest {
    @testSetup static void setup(){
        Account a1 = new Account(Name ='a1',BillingCity = 'Hathras',IsOppEligibleForClose__c = True,Type = 'Partner',CopyBillingToShipping__c=True);
        insert a1;
        Contact c1 = new Contact(LastName='c1',AccountId = a1.Id);
        insert c1;
        Opportunity op1 = new Opportunity(Name = 'op1',StageName = 'Perception Analysis',CloseDate = System.today(),AccountId = a1.Id);
        insert op1;
        Account a2 = new Account(Name ='a2',BillingCity = 'Hathras',NumberofLocations__c=3);
        insert a2;
        Contact c2 = new Contact(LastName='c2',AccountId = a2.Id);
        insert c2;
        Account a3 = new Account(Name = 'a3');
        insert a3;
    }
    public static TestMethod void accountTest(){
        Account ac1 = [SELECT Id,Name,BillingCity FROM Account WHERE Name ='Mr.a1'];
        Account ac2 = [SELECT Id,Name,BillingCity FROM Account WHERE Name ='Mr.a2'];
        Contact c1 = [SELECT Id,LastName,email FROM Contact WHERE Name = 'c1'];
        Contact c2 = [SELECT Id,LastName,email FROM Contact WHERE Name = 'c2'];
        ac1.Name = 'Mathura';
        update ac1;
        c2.email = 'gauravms@gmail.com';
        update c2;
        ac2.Name = 'Vrindavan';
        update ac2;
        Account a3 = new Account(Name ='a2',BillingCity = 'Hathras',NumberofLocations__c=3);
       	try{
            insert a3;
            delete ac2;
        }
        catch(Exception e){
            System.debug('You cannot delete the Account');
        }
    }
}